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
        groups = params[:group_id] if params[:group_id]
      if current_account.auth == Auth::ADMIN then
        disclosureRanges = DisclosureRange.pluck("id")
        groups = Group.all.pluck("id")  if !params[:group_id]
      else
        disclosureRanges = DisclosureRange.where.not('id = ?', DisclosureRangeList::ADMIN).pluck("id")
        groups = GroupRelation.where(account_id:current_account.id)
                              .pluck("group_id")  if !params[:group_id]
      end
      session[:account_groups] = groups
    else
      groups = params[:group_id] 
      puts groups
        groups = Group.all.pluck("id") if !params[:group_id]
     puts groups
     puts !params[:group_id]
    end
 
    if !params[:id] then
      puts "中野中"
      @data = Article.where(disclosureRange_id: disclosureRanges)
                      .where(group_id: groups)
                      .or(Article.where(disclosureRange_id: DisclosureRangeList::PUBLIC)) # ログインアカウントに所属しないグループの外部公開の記事は表示させる（編集は不可）
                      .order('created_at desc')                    
    else
      if (params[:id] == "0") then
        puts "外野外1"
        @data = Article.where(disclosureRange_id: disclosureRanges)
                        .where(group_id: groups)
                        .order('created_at desc') 
      else 
        puts "外野外2"
        @data = Article.where(disclosureRange_id: disclosureRanges)
                        .where(group_id: groups)
                        .where(category_id: params[:id])
                        .order('created_at desc') 
      end               
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
