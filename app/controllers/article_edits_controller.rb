class ArticleEditsController < ApplicationController
  layout 'article'
  before_action :authenticate_account!, only:[:index,:add,:edit,:delete,:edit]
  require_relative './lib/util.rb'
  require "#{Rails.root}/config/initializers/constants.rb"

  def index
    @data = Article.where(account_id:current_account.id)
                  .order('created_at desc')
                  .page(params[:page])
                  .per(15)
                 # .includes(:accounts, :groups, :categories,:disclosure_ranges)
  end

  def new
    @util = Util.new
    @article = Article.new
    if current_account.auth == Auth::ADMIN then
      @disclosureRanges = DisclosureRange.all
      @groups = Group.where('del_flg = ?', DelFlg::USE)
    else
      @disclosureRanges = DisclosureRange.where.not('id = ?', DisclosureRangeList::ADMIN)
      @groups = Group.where(id: GroupRelation.where(account_id:current_account.id)
                    .pluck("group_id"))
                    .where('del_flg = ?', DelFlg::USE)
    end
    @categories_select = Category.where('del_flg = ?', DelFlg::USE)

    if request.post? then
      @article = Article.create articles_params
      redirect_to '/'
    end
  end

  def create
    @util = Util.new
    @article = Article.new
    if current_account.auth == Auth::ADMIN then
      @disclosureRanges = DisclosureRange.all
      @groups = Group.where('del_flg = ?', DelFlg::USE)
    else
      @disclosureRanges = DisclosureRange.where.not('id = ?', DisclosureRangeList::ADMIN)
      @groups = Group.where(id: GroupRelation.where(account_id:current_account.id)
                    .pluck("group_id"))
                    .where('del_flg = ?', DelFlg::USE)
    end
    @categories_select = Category.where('del_flg = ?', DelFlg::USE)

    if request.post? then
      @article = Article.create articles_params
      redirect_to '/'
    end
  end

  def edit
    @util = Util.new
    @article = Article.find params[:id]
    if current_account.auth == Auth::ADMIN then
      @disclosureRanges = DisclosureRange.all
      @groups = Group.where('del_flg = ?', DelFlg::USE)
      puts @groups
    else
      @disclosureRanges = DisclosureRange.where.not('id = ?', DisclosureRangeList::ADMIN)
      @groups = Group.where(id: GroupRelation.where(account_id:current_account.id)
                    .pluck("group_id"))
                    .where('del_flg = ?', DelFlg::USE)
    end
    @categories_select = Category.where('del_flg = ?', DelFlg::USE)
    if request.patch? then
      @article.update articles_params
      redirect_to '/'
    end
  end

  def destroy
    @article = Article.find params[:id]
    if request.post? then
      @article.destroy
      redirect_to '/'
    end
  end

  private
  def articles_params
    params.require(:article).permit(:title, :content, :category_id, :group_id, :account_id, :disclosureRange_id, :image)
  end
end
