class JobPushWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find(job_id)
    job_subs = JobSub.with_language(job.language).confirmed
    job_subs.each do |job_sub|
      SubscriptionMailer.delay.push_a_job(job.id, job_sub.id)
    end
  end
end