class ReactsController < ApplicationController
  def index
  end

  def ajax
    disclosureRanges = 1
    @is_category = false
    if account_signed_in? then
      if current_account.auth == Auth::ADMIN then
        disclosureRanges = DisclosureRange.pluck("id")
        groups = Group.all.pluck("id") 
      else
        disclosureRanges = DisclosureRange.where.not('id = ?', DisclosureRangeList::ADMIN).pluck("id")
        groups = GroupRelation.where(account_id:current_account.id)
                              .pluck("group_id")
      end
      session[:account_groups] = groups
    else
      groups = Group.all.pluck("id") 
    end
    if !params[:id] then
      @data = Article.where(disclosureRange_id: disclosureRanges)
                      .where(group_id: groups)
                      .or(Article.where(disclosureRange_id: DisclosureRangeList::PUBLIC))
                      .order('created_at desc')                    
    else
      @is_category = params[:id]
      @category_name = params[:name]
      @data = Article.where(disclosureRange_id: disclosureRanges)
                    .where(group_id: groups)
                    .where('category_id = ?', params[:id])
                    .or(Article.where(disclosureRange_id: DisclosureRangeList::PUBLIC))
                    .order('created_at desc')                   
    end
    render plain:@data.to_json 
    end
end
