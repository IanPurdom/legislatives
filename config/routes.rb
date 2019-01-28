Rails.application.routes.draw do
  # get 'candidates/index'

  # get 'candidates/new'

  # get 'candidates/create'

  # get 'candidates/edit'

  # get 'candidates/update'

  # get 'candidates/destroy'

  devise_for :users
  resources :candidates do 
    get 'poster', on: :member
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
