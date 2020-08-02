class CategoriesController < ApplicationController
  layout 'article'
  before_action :authenticate_account!, only: [:index, :add, :edit, :delete, :edit]

  def index
    @category = Category.new
    @data = Category.all.order(:del_flg)
  end

  def add
    @category = Category.new
    if request.post? then
      @bloggnere = Category.create category_params
      redirect_to '/categories'
    end
  end

  def edit
    @category = Category.find params[:id]
    if request.patch? then
      @category.update category_params
      redirect_to '/categories'
    end
  end

  def stop
    @category = Category.find params[:id]
    if request.patch? then
      @category.update(del_flg: DelFlg::STOP)
      redirect_to '/categories'
    end
  end

  def restart
    @category = Category.find params[:id]
    if request.patch? then
      @category.update(del_flg: DelFlg::USE)
      redirect_to '/categories'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end