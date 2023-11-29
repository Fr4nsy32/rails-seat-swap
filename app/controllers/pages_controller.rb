class PagesController < ApplicationController
  def home
    # hello
  end

  def dashboard
    @my_bookings_requests = Booking.joins(:job).where(jobs: { user: current_user })
    @my_bookings = Booking.where(user: current_user)
    @my_jobs = Job.where(user: current_user)
    @my_reviews = Review.where(booking: @my_bookings)
    @my_credits = current_user.credit
  end

end
