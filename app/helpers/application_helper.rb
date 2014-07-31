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

  def admin?
    session[:admin]
  end
end
