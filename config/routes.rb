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
  resources :members, param: :email, constraints: { email: /.*/ }
  resources :contact_form, only: [:contact_us, :create]

  root to: 'routes#home'
  get 'home', to: 'routes#home'
  get 'about', to: 'routes#about'
  get 'team', to: 'routes#team'
  get 'social_media', to: 'routes#social_media'
  get 'contact', to: 'contact_form#index'
  post 'contact', to: 'contact_form#create'

  get 'dashboard', to: 'events#dashboard'

  get 'status', to: 'members#status'
  delete 'members/:id', to: 'members#destroy'
  get 'profile', to: 'members#profile'
  get 'profile/edit', to: 'members#edit'

  get 'apply', to: 'apply#q_index'
  get 'questions', to: 'apply#q_index'
  post 'questions', to: 'apply#q_create'
  put 'questions/:id', to: 'apply#q_update'
  delete 'questions/:id', to: 'apply#q_destroy'
  get 'answers', to: 'apply#a_index'
  post 'answers', to: 'apply#a_create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routes.html
end
