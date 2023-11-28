class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    current_user
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])
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

  private

  def job_params
    params.require(:job).permit(:title, :description, :price, :location, :available_from, :credit_to_earn)
  end
end
