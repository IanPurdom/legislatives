Rails.application.routes.draw do
  # get 'candidates/index'

  # get 'candidates/new'

  # get 'candidates/create'

  # get 'candidates/edit'

  # get 'candidates/update'

  # get 'candidates/destroy'

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :candidates do 
    get 'poster', on: :member
    get 'validate', on: :member
    get 'reject', on: :member
    post 'attach', on: :member
    post 'remove_attachment', on: :member
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
