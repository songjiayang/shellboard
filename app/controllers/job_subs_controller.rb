class JobSubsController < ApplicationController

  def create
    @sub = JobSub.new(sub_params)
    @sub.language = 0
    if @sub.save
    else
    end
  end

  def confirm
    @sub = SubJob.find(params[:id])
    raise BadRequest if @sub.confirm_token != params[:confirm_token]
    if @sub.confirm!
    else
    end
  end


  private

  def sub_params
    params.require(:job_sub).permit(:email)
  end

end