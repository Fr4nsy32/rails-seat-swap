class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
