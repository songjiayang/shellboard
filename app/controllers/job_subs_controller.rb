class JobSubsController < ApplicationController

  def create
    @sub = JobSub.new(sub_params)
    @sub.language = current_language
    if @sub.save
      SubscriptionMailer.delay.confirm(@sub.id)
      redirect_to enhanced_referrer, :notice => '订阅确认邮件已发送到你邮箱，请去确认。'
    else
      redirect_to enhanced_referrer, :alert => @sub.errors.to_a.first
    end
  end

  def confirm
    @sub = JobSub.find(params[:id])
    raise BadRequest if @sub.confirm_token != params[:confirm_token]
    if @sub.confirm!
      redirect_to root_path, :notice => '订阅邮件已通过确认，你将获得最新工作信息。'
    else
      redirect_to root_path, :alert => '订阅邮件确认失败。'
    end
  end

  def setting
    @sub = JobSub.find(params[:id])
    raise BadRequest if @sub.confirm_token != params[:confirm_token]
  end


  private

  def sub_params
    params.require(:job_sub).permit(:email)
  end

end