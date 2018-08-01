class ReviewsController < ApplicationController
  def show
    @review = Review.find(paramas[:id])
  end
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
  end

  private
  review_params
    params.require(:review).permit(:description,:rating)
  def
end
