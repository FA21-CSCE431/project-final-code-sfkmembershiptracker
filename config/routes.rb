Rails.application.routes.draw do
  resources :participations
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :sfk_infos
  resources :applications
  resources :events
  resources :positions
  resources :members, param: :email, constraints: { email: /.*/ }
  resources :contact_form, only: [:contact_us, :create]
  resources :blog_posts

  root to: 'routes#home'
  get 'home', to: 'routes#home'
  get 'about', to: 'routes#about'
  get 'team', to: 'routes#team'
  get 'social_media', to: 'routes#social_media'
  get 'contact', to: 'contact_form#index'
  post 'contact', to: 'contact_form#create'
  get 'blog', to: 'blog_posts#index'

  get 'dashboard', to: 'events#dashboard'
  get 'dashboard/applicant', to: 'events#act_on_applicant'
  get 'dashboard/questions/new', to: 'events#q_new'
  post 'dashboard/questions', to: 'events#q_create'
  get 'dashboard/questions/:id', to: 'events#q_edit'
  put 'dashboard/questions/:id', to: 'events#q_update'
  get 'dashboard/questions/:id/destroy', to: 'events#q_destroy'

  get 'status', to: 'members#status'
  delete 'members/:id', to: 'members#destroy'
  get 'profile', to: 'members#profile'
  get 'profile/edit', to: 'members#edit'
  get 'apply', to: 'apply#q_index'
  
  get 'answers', to: 'apply#a_index'
  post 'answers', to: 'apply#a_create'

  get 'about', to: 'routes#about'
  get 'help', to: 'routes#help'

  match '/404', to: 'errors#not_found', via: :all
  match '/406', to: 'errors#unacceptable', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server', via: :all
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routes.html
end
