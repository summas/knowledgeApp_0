class ReactsController < ApplicationController
  layout 'article'

  def index
  end

  def show
  end

  def article
     @article = Article.find params[:id]        
    # @article = Article.select(:content).where(id: params[:id])
    content = {params[:id] => @article.content.to_s}
    # @content["content"] = @article.content.to_s
    render plain:content.to_json
  end

  def ajax
    disclosureRanges = 1
    @is_category = false
    if account_signed_in? then
        groups = params[:grp] if params[:grp]
        puts "paramsセット後2"
        puts groups
      if current_account.auth == Auth::ADMIN then
        disclosureRanges = DisclosureRange.pluck("id")
        groups = Group.all.pluck("id")  if !params[:grp]
      else
        disclosureRanges = DisclosureRange.where.not('id = ?', DisclosureRangeList::ADMIN).pluck("id")
        groups = GroupRelation.where(account_id:current_account.id)
                              .pluck("group_id")  if !params[:grp]
      end
      session[:account_groups] = groups
    else
      puts groups
      groups = params[:grp] if params[:grp]
     groups = Group.all.pluck("id") if !params[:grp]
    end
    puts "グループセッティングあと3"
    puts groups
    if !params[:id] then
      @data = Article.where(disclosureRange_id: disclosureRanges)
                      .where(group_id: groups)
                      .or(Article.where(disclosureRange_id: DisclosureRangeList::PUBLIC)) # ログインアカウントに所属しないグループの外部公開の記事は表示させる（編集は不可）
                      .order('created_at desc')                    
    else
      @is_category = params[:id]
      @data = Article.where(disclosureRange_id: disclosureRanges)
                    .where(group_id: groups)
                    .where('category_id = ?', params[:id])
                    .order('created_at desc')                   
    end
    render plain:@data.to_json 
  end

  def category
    @category = Category.all.order(:del_flg)
    render plain:@category.to_json 
  end

  def group
    if account_signed_in? then
      if current_account.auth == Auth::ADMIN then
        groups = Group.all
      else
        groups = Group.where(id:GroupRelation.where(account_id:current_account.id)
                              .pluck("group_id"))
      end
    else
     groups = Group.all
    end
    render plain:groups.to_json 
  end
end
