task :set_job_deadline => :environment  do
  Job.where(:deadline => nil).each do |job|
    job.deadline = (job.created_at + 1.month).to_date
    job.save
  end
end