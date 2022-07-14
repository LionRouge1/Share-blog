Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index'
  scope 'users/:user_id', as: 'user' do
    resources :posts, only: [:index, :show]
  end
  resources :users, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
