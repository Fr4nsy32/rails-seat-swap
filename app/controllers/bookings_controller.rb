class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
                       .or(Booking.where(job: current_user.jobs))
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    current_user
    @job = Job.find(params[:job_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.job = Job.find(params[:job_id])
    if @booking.save
      redirect_to @booking, notice: "Booking was added was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
