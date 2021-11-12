Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :sfk_infos
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
  get 'dashboard/applicant', to: 'events#act_on_applicant'
  get 'status', to: 'members#status'
  delete 'members/:id', to: 'members#destroy'
  get 'profile', to: 'members#profile'
  get 'profile/edit', to: 'members#edit'
  get 'apply', to: 'apply#q_index'
	
	get 'questions', to: 'events#q_index'
  post 'questions', to: 'events#q_create'
	get 'questions/new', to: 'events#q_new', as: 'new_question'
  put 'questions/:id', to: 'events#q_update'
  delete 'questions/:id', to: 'events#q_destroy'
	get 'questions/:id/edit', to: 'events#q_edit', as: 'edit_question'
	patch 'questions/:id', to: 'events#q_update'
	delete 'questions/:id', to: 'events#q_destroy', as: 'delete_question'
	get 'questions/:id', to: 'events#q_delete'
  
  get 'answers', to: 'apply#a_index'
  post 'answers', to: 'apply#a_create'

  get 'about', to: 'routes#about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routes.html
end
