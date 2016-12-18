Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :monsters
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
