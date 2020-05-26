class Api::V1::ReviewsController < ApplicationController
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
    review = Review.find(params[:id])

    render json:review
  end

  def update
    review = review.find(params[:id])
  end

  def destroy
    review.find(params[:id]).destroy
  end

  private

  def review_params
    params.require(:review).permit(:spoiler, :content)
  end
end
