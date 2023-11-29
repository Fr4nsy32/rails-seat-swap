class ReviewsController < ApplicationController
  def new
    @job = Job.find(params[:job_id])
    @booking = Booking.find(params[:booking_id])
    @review = @booking.reviews.build
  end

def create
    @job = Job.find(params[:job_id])
    @booking = Booking.find(params[:booking_id])
    @review = @booking.reviews.build(review_params)

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
