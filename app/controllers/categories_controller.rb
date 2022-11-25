class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
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

  def show
    @category = Category.includes(:records).find(params[:id])
    @records = @category.records.order(created_at: :desc)
    puts @records
  end

  def distroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
