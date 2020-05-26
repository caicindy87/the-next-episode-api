class Api::V1::ReviewsController < ApplicationController
  def create
    # should find instance of saved_show instead of using new
    # and then build the review off of that saved_show instance. this way the review is related to the saved_show and a saved_show can have many reviews
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
