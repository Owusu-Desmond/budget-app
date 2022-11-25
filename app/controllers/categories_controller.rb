class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[destroy]

  def index
    @categories = Category.where(author_id: current_user.id)
  end

  def create
    @category = Category.new(category_params)
    @category.author = current_user
    if @category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to categories_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def new
    @category = Category.new
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
