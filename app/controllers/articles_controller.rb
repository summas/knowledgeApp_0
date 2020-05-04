class ArticlesController < ApplicationController
  layout 'article'
 # before_action :authenticate_account!, only:[:add,:edit,:delete,:edit]
  before_action :setLayout

  def index
    if !params[:id] then
      @data = Article.order('created_at desc')
      .page params[:page]
    else
      @category = Category.find params[:id]
      @data = Article.where('category_id = ?', params[:id])
      .order('created_at desc')
      .page params[:page]
    end
  end

  def add
    @article = Article.new
    if request.post? then
      @article = Article.create articles_params
      redirect_to '/articles/index'
    end
  end

  def edit
    @article = Article.find params[:id]
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

  def show
		@article = Article.find params[:id]
  end

  def setLayout
    @account = current_account
    @articleconfig = SiteConfig.find 1
    @categories = Category.all
    @account = current_account
  end

  private
  def articles_params
    params.require(:article).permit(:title, :subtitle, :content, :category_id)
  end
end
