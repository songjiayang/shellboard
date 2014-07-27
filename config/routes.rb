class LanguageSubdomain
  def self.matches?(request)
    language_index = Job::LANGUAGE.index(request.subdomain)
    request.session[:language] = language_index
  end
end

Rails.application.routes.draw do

  constraints(LanguageSubdomain) do
    resources :jobs
    resources :job_subs, only: [:create]

    root :to => "jobs#index" 
  end

  # root :to => "jobs#index" 

end
