Rails.application.routes.draw do

  resources :jobs

  root :to => "jobs#index"

end
