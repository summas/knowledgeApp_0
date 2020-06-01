class ArticleEditsController < ApplicationController
  layout 'article'
  before_action :authenticate_account!, only:[:add,:edit,:delete,:edit]
  require_relative './lib/util.rb'

  def index
    @data = Article.all.order('created_at desc').page(params[:page])
    .per(15)
  end

  def add
    @util = Util.new
    @article = Article.new
    @groups = Group.all
    @disclosureRanges = DisclosureRange.all
    if request.post? then
      @article = Article.create articles_params
      redirect_to '/articles/index'
    end
  end

  def edit
    @util = Util.new
    @article = Article.find params[:id]
    @groups = Group.all
    @disclosureRanges = DisclosureRange.all
    if request.patch? then
      @article.update articles_params
      redirect_to '/articles'
    end
  end

  def delete
    @article = Article.find params[:id]
    if request.post? then
      @article.destroy
      redirect_to '/articles'
    end
  end

  def category
    @category = Category.find params[:id]
    @data = Article.where('category_id = ?', params[:id])
    .order('created_at desc')
    .page params[:page]
  end

  private
  def articles_params
    params.require(:article).permit(:title, :content, :category_id, :group_id, :account_id, :disclosureRange_id, :image)
  end
end
