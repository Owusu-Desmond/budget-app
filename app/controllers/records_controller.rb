class RecordsController < ApplicationController
  before_action :set_category, only: %i[new create destroy]

  def new
    @category = Category.includes(:category_records).find(params[:category_id])
    @record = @category.records.new
  end

  def create
    @record = Record.new(record_params)
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

  private

  def set_category
    @category = Category.find(params[:category_id])
  end
end
