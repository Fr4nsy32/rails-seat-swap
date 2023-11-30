class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user).or(Booking.where(job: current_user.jobs))
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
    @booking.start_date = @booking.job.available_from
    if @booking.save
      redirect_to @booking, notice: "Booking was added was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    current_user
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: "Job was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
    if @booking.status == "booked"
      @booking.job.available = false
      @booking.job.save
      current_user.credit -= @booking.job.price
      current_user.save
    else
      @booking.job.available = true
      @booking.job.save
    end
  end

  def destroy
    current_user
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path, notice: "Booking was successfully destroyed."
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
