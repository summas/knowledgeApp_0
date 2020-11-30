class ReactsController < ApplicationController
  layout 'article'

  # def index; end

  # def show; end

  def article
    @article = Article.find params[:id]
    # @article = Article.select(:content).where(id: params[:id])
    content = { params[:id] => @article.content.to_s }
    # @content["content"] = @article.content.to_s
    render plain: content.to_json
  end

  def ajax
    @is_category = false
    re_obj = get_disclosure_ranges_groups(params[:group_id])

    disclosure_ranges = re_obj[0]
    groups = re_obj[1]
    session[:account_groups] = groups

    @data = if !params[:id]
              article_no_category(disclosure_ranges, groups)
            elsif params[:id] == '0'
              article_category_0(disclosure_ranges, groups)
            else
              article_with_category(disclosure_ranges, groups, params[:id])
            end
    render plain: @data.to_json
  end

  def category
    @category = Category.all.order(:del_flg)
    render plain: @category.to_json
  end

  def group
    groups = if account_signed_in?
               if current_account.auth == Auth::ADMIN
                 Group.all
               else
                 Group.where(id: GroupRelation.where(account_id: current_account.id)
                                       .pluck('group_id'))
               end
             else
               Group.all
             end
    render plain: groups.to_json
  end
end
