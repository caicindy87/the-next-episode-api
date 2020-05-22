class Api::V1::SavedShowsController < ApplicationController
  before_action :find_saved_show, only: [:show, :update, :destroy]

  def index
    render json: SavedShow.all
  end

  def create
    saved_show = SavedShow.new(saved_show_params)

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
    params.require(:saved_show).permit(:rating, :watch_date, :show_id, :user_id)
  end

  def find_saved_show
    @saved_show = SavedShow.find(params[:id])
  end
end
