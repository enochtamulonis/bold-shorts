Rails.application.routes.draw do
  devise_for :users
  resource :dashboard, only: [:show], controller: :dashboard
  resources :shorts, only: [:new, :create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root to: 'dashboard#show', as: :authenticated_user_root
  end

  unauthenticated :user do
    root to: 'pages#home', as: :unauthenticated_user_root
  end

end
