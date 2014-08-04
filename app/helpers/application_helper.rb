module ApplicationHelper

  def title
    @title ||= "#{current_language_capitalize} jobs in China"
  end

  def current_language_humanize
    @current_language_humanize ||= Job::LANGUAGE[current_language]
  end

  def current_language_capitalize
    @current_language_capitalize ||=  current_language_humanize.capitalize
  end

  def jobs_cache_key(page)
    Job.with_language(current_language).latest.first.try(:updated_at).to_s + page.to_s
  end
end
