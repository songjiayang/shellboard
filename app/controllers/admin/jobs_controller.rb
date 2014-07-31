class Admin::JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :confirm]

  def index
    @jobs = Job.unconfirmed.with_language(current_language).latest.page(params[:page]).per(25)
    render 'jobs/index' 
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to admin_jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    render 'jobs/show'
  end

  def confirm
    if @job.confirm!
      JobPushWorker.perform_async(@job.id)
      redirect_to admin_jobs_path, notice: '已经通过验证。' 
    else
      redirect_to admin_job_path(@job), :alert => "通过验证失败"
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end