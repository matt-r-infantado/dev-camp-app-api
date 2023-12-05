Rails.application.routes.draw do
  root "dashboards#index"

  resources :dashboards
  resources :users
  resources :gates
  resources :roles do 
    post :add_gate
    post :remove_gate
  end
  resources :sessions do 
    collection do 
      get :logout
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
