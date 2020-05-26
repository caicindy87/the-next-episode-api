class Api::V1::SavedShowsController < ApplicationController
  before_action :find_saved_show, only: [:show, :update, :destroy]

  def index
    render json: SavedShow.all
  end

  def create
    # also need to find or create a new Show instance b/c we need to save the show if user is trying to save a show from their search
    # then, build saved_show off the Show instance.
    show = Show.create_with!(show_params).find_or_create_by(params[:show_id])
    saved_show = show.saved_shows.build(saved_show_params)

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
