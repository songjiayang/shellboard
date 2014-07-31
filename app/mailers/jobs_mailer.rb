class JobsMailer < ActionMailer::Base
  default from: "no-reply@shellboard.com"

  def sent_manage_token(job_id)
    @job = Job.find(job_id)
    mail to: @job.email,  subject: "［#{@job.title}］管理链接"
  end
end
