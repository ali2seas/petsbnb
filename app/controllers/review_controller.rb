class ReviewController < ApplicationController
  def show
    @review = Review.find(paramas[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to dashboard_path
  end

  private

  def review_params
    params.require(:review).permit(:description,:rating)
  end
end
