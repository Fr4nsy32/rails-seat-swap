class BookingsController < ApplicationController

  def index
    @bookingrecived = []
    @bookingmade = []
    @bookings = Booking.all
    @bookings.each do |booking|
      if booking.job.user == current_user
        @bookingrecived << booking
      elsif booking.user == current_user
        @bookingmade << booking
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @job = @booking.job
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

  def confirm
    raise
    @booking = Booking.find(params[:id])
    # @booking.status = "confirmed"
    @booking.update(params[:status] = "confirmed"    )
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
