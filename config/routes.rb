Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :participants
  resources :applications
  resources :events
  resources :positions
  resources :members
  resources :contact_form, only: [:contact_us, :create]

  root to: 'routes#home'
  get 'home', to: 'routes#home'
  get 'about', to: 'routes#about'
  get 'gallery', to: 'routes#gallery'
  get 'team', to: 'routes#team'
  get 'status', to: 'routes#status'
  get 'profile', to: 'members#show'
  get 'profile/edit', to: 'members#edit'
  get 'contact', to: 'contact_form#index'
  post 'contact', to: 'contact_form#create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routes.html
end
