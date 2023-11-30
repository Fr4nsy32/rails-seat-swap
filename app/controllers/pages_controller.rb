class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # hello
  end

  def dashboard
    @my_bookings_requests = Booking.joins(:job).where(jobs: { user: current_user })
    @my_bookings = Booking.where(user: current_user)
    @my_jobs = Job.select(:id, :title, :description, :location, :price).where(user_id: current_user.id)
    @my_reviews = Review.where(booking: @my_bookings)
    @my_credits = current_user.credit
  end

end
