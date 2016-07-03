class CategoriesController < ApplicationController

  def index
  end

  def new
    @category =  Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category has been created."
      redirect_to @category
    else
      flash.now[:alert] = "Category has not been created."
      render 'new'
    end
  end

  private

    def category_params
      params.require(:category).permit(:title, :description)
    end

end
