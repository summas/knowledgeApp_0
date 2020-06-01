class CategoriesController < ApplicationController
  layout 'article'

  def index
    @category = Category.new
    @data = Category.all
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

  def delete
    @category = Category.find params[:id]
    @category.destroy
    Article.where(category_id: params[:id]).update( category_id: '1')
    redirect_to '/categories'
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end