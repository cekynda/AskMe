Rails.application.routes.draw do
  root 'pages#index'
  
  resources :users, only: %i[new create]
  resources :questions do
    resources :answers
  end
end
