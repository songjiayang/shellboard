module LanguageAble
  extend ActiveSupport::Concern

  def language_humanize
    Job::LANGUAGE[self.language].to_s
  end

  def language_capitalize
    language_humanize.capitalize
  end
  
end