class JobsController < ApplicationController

  def index
    @jobs = Job.all
    raise
  end

  def show
    @job = Job.find(params[:id])
    @bookings = @job.bookings.includes(:reviews)
    @my_booking = @job.bookings.find_by(user: current_user)
    @new_review = @my_booking.reviews.build if @my_booking.present?

  end

  def new
    current_user
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to @job, notice: "Job was added was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    current_user
    @job = Job.find(params[:id])
  end

  def update
    current_user
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to @job, notice: "Job was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, notice: "Job was successfully destroyed."
  end


  def my_jobs
    @jobs = current_user.jobs
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :price, :address, :available_from, :credit_to_earn, images: [])
  end
end
