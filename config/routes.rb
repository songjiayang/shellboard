class LanguageSubdomain
  def self.matches?(request)
    language_index = Job::LANGUAGE.index(request.subdomain)
    request.session[:language] = language_index
  end
end

class CanAccessAdmin
  def self.matches?(request)
    request.session[:admin]
  end
end

# require 'sidekiq/web'

Rails.application.routes.draw do

  constraints(LanguageSubdomain) do
    resources :jobs, except: [:destroy]
    resources :job_subs, only: [:create] do 
      member do 
        get :confirm
        get :setting
      end
    end

    root :to => "jobs#index" 
  end

  namespace :admin do
    constraints(CanAccessAdmin) do
      resources :jobs, only: [:index, :show] do 
        member do 
          post :confirm
        end
      end
    end
    get '/login', to: 'sessions#new' 
  end

  # mount Sidekiq::Web => '/sidekiq'

  # root :to => "jobs#index" 

end
