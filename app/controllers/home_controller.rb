class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :index }
    end
  end
end
