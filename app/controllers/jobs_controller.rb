class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.create(job_params.merge(user: current_user))
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :price, :location, :available_from, :credit_to_earn)
  end
end
