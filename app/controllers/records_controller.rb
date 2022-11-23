class RecordsController < ApplicationController
  before_action :set_category, only: [:index, :new, :create, :destroy]
  def index
    @records = Record.all.order("created_at DESC")
  end

  def new
    @record = Record.new
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
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to category_records_path(@category)
  end

  def record_params
    params.require(:record).permit(:name, :amount)
  end

  private 

  def set_category
    @category = Category.find(params[:category_id])
  end
end
