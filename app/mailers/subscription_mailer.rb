class SubscriptionMailer < ActionMailer::Base
  default from: "no-reply@shellboard.com"

  def confirm(job_sub)
    @job_sub = JobSub.find(job_sub)
    
    mail to: @job_sub.email,  subject: "[#{ActionMailer::Base.default_url_options[:host]}]#{@job_sub.language_capitalize}订阅列表确认"
  end

  def push_a_job(job_id, job_sub_id)
    @job = Job.find(job_id)
    @job_sub = JobSub.find(job_sub_id)
    mail to: @job_sub.email,  subject: "#{@job_sub.language_capitalize} jobs: #{@job.title}"
  end
end
