class RecordsController < ApplicationController
  before_action :set_category, only: %i[new create index destroy]

  def new
    @categories = Category.where(author_id: current_user.id)
    @record = Record.new
  end

  def index
    @records = Category.find(params[:category_id]).records.order(created_at: :desc)
    @total_amount = @records.sum(:amount)
  end

  def create
    @record = Record.new(record_params)
    @record.author = current_user
    @categories = Category.where(id: category_params['category_ids'])
    @record.categories << @categories
    @record.author = current_user

    if @record.save
      flash[:notice] = 'Record was successfully created.'
      redirect_to category_records_path(@category)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    @categories = Category.includes(:category_records).find(params[:category_id])
    @records = @category.records.includes(:category_records).find(params[:id])
    @records.destroy
  end

  def record_params
    params.require(:record).permit(:name, :amount)
  end

  def category_params
    params.require(:record).permit(category_ids: [])
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end
end
