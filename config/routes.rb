Rails.application.routes.draw do
  scope 'users/:user_id', as: 'user' do
    resources :posts, only: [:index, :show]
  end
  resources :users, only: [:index, :show]
end
