class ReviewsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])

    if @review.save
      redirect_to dashboard_path, notice: "Review created successfully."
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :rating, :description)
  end
end

# add and commit in this branch
# go to master to pull the latest master
# come back to this branch and merge master into this branch
# push this branch to github
