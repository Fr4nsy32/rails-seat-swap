class ReviewsController < ApplicationController
  def new
    #@job = Job.find(params[:job_id])
    #@booking = Booking.find(params[:booking_id])
    #@review = @booking.reviews.build
    @review = Review.new
  end

def create
    #@job = Job.find(params[:job_id])
    #@booking = Booking.find(params[:booking_id])
    #@review = @booking.reviews.build(review_params)
    @review = Review.new(review_params)
    @review.job = @job
    @review.user = current_user

    if @review.save
      redirect_to job_path(@job), notice: "Review created successfully."
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
