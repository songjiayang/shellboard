ActionMailer::Base.smtp_settings = {
  :address              => Settings.smtp_settings.address,
  :port                 => Settings.smtp_settings.port,
  :domain               => Settings.smtp_settings.domain,
  :user_name            => Settings.smtp_settings.user_name,
  :password             => Settings.smtp_settings.password,
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"