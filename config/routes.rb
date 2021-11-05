Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :participants
  resources :payments
  resources :applications
  resources :events
  resources :officer_positions
  resources :members

  root to: 'routes#home'
  get 'home', to: 'routes#home'
  get 'about', to: 'routes#about'
  get 'gallery', to: 'routes#gallery'
  get 'team', to: 'routes#team'
  get 'status', to: 'routes#status'
  get 'apply', to: 'apply#q_index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routes.html
end
