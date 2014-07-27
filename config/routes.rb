Rails.application.routes.draw do

  resources :jobs
  resources :job_subs, only: [:create]

  root :to => "jobs#index" 

end
