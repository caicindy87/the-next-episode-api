class Api::V1::ShowsController < ApplicationController
  def index
    render json: Show.all
  end

  def show
    show = Show.find(params[:id])

    render json:show
  end

  private
  def show_params
    params.require(:show).permit(:name, :started_date, :ended_date, :network,:country, :status, :image)
  end
end

