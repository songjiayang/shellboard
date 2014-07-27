class JobSubsController < ApplicationController

  def create
    @sub = JobSub.new(sub_params)
    @sub.language = 0
    if @sub.save
      redirect_to enhanced_referrer, :notice => '订阅确认邮件已发送到你邮箱，请去确认。'
    else
      redirect_to enhanced_referrer, :alert => @sub.errors.to_a.first
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