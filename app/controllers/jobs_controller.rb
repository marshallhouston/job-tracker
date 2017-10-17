class JobsController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @categories = Category.all
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    if params[:company_id]
      @job = Job.find(params[:id])
    else
      @job = Job.find(params[:id])
      @comment = Comment.new
      @comment.job_id = @job.id
    end
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
    @categories = Category.all
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    @company = @job.company
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    job = Job.find(params[:id])
    company = job.company
    job.destroy

    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
