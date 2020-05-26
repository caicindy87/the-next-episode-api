class Api::V1::SavedShowsController < ApplicationController
  before_action :find_saved_show, only: [:show, :update, :destroy]

  def index
    render json: SavedShow.all
  end

  def create
    tvShow = Show.create_with(show_params).find_or_create_by(id: params[:show_id])
    # name: params[:name], start_date: params[:start_date], end_date: params[:end_date], network: params[:network], country: params[:country], status: params[:status], image_thumbnail_path: params[:image_thumbnail_path]
    # tvShow = Show.find_or_create_by(name: params[:name]) do |show|
    #   show.name = show_params[:name]
    #   show.start_date = show_params[:start_date]
    #   show.end_date = show_params[:end_date]
    #   show.network = show_params[:network]
    #   show.country = show_params[:country]
    #   show.status = show_params[:status]
    #   show.image_thumbnail_path = show_params[:image_thumbnail_path]
    # end
    saved_show = tvShow.saved_shows.build(saved_show_params)

    if saved_show.valid?
      saved_show.save
      render json: saved_show
    else
      render json: {errors: saved_show.errors.full_messages}
    end
  end

  def show
    render json: @saved_show
  end

  def update
    if @saved_show.update(saved_show_params)
      render json: @saved_show
    else
      render json: {errors: @saved_show.errors.full_messages}
    end
  end

  def destroy
    @saved_show.destroy
  end

  private

  def saved_show_params
    params.require(:saved_show).permit(:rating, :show_id, :user_id)
  end

  def show_params
    params.require(:show).permit(:name, :start_date, :end_date, :network, :country, :status, :image_thumbnail_path)
  end

  def find_saved_show
    @saved_show = SavedShow.find(params[:id])
  end
end
