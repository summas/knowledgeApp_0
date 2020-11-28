class ArticlesController < ApplicationController
  require_relative './lib/util.rb'
  layout 'article'
  before_action :authenticate_account!, only:[:add,:edit,:delete,:edit]

  def index
    @is_category = false
    re_obj = get_disclosure_ranges_groups(params[:group_id])

    disclosure_ranges = re_obj[0]
    groups = re_obj[1]
    session[:account_groups] = groups

    if !params[:id] then
      @data = Article.where(disclosureRange_id: disclosure_ranges)
                     .where(group_id: groups)
                     .where(disclosureRange_id: DisclosureRangeList::PUBLIC)
                     .order('created_at desc')
                     .page params[:page]
    else
      @is_category = params[:id]
      @category_name = params[:name]
      @data = Article.where(disclosureRange_id: disclosure_ranges)
                    .where(group_id: groups)
                    .where('category_id = ?', params[:id])
                    .where(disclosureRange_id: DisclosureRangeList::PUBLIC)
                    .order('created_at desc')
                    .page params[:page]
    end
  end

  def show
		@article = Article.find params[:id]
  end

  def react; end

  private
  def articles_params
    params.require(:article).permit(:title, :subtitle, :content, :category_id)
  end
end
