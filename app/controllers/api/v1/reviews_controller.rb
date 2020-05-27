class Api::V1::ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :update, :destroy]

  def create
    saved_show = SavedShow.find(params[:saved_show_id])
    review = saved_show.reviews.build(review_params)

    if review.valid?
      review.save
      render json: review
    else
      render json: {errors: review.errors.full_messages}
    end
  end

  def show
    render json: @review
  end

  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: {errors: @review.errors.full_messages}
    end
  end

  def destroy
    @review.destroy
  end

  private

  def review_params
    params.require(:review).permit(:spoiler, :content)
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
