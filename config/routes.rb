class LanguageSubdomain
  def self.matches?(request)
    language_index = Job::LANGUAGE.index(request.subdomain)
    request.session[:language] = language_index
  end
end

require 'sidekiq/web'

Rails.application.routes.draw do

  constraints(LanguageSubdomain) do
    resources :jobs
    resources :job_subs, only: [:create] do 
      member do 
        get :confirm
        get :setting
      end
    end

    root :to => "jobs#index" 
  end

  mount Sidekiq::Web => '/sidekiq'

  # root :to => "jobs#index" 

end
