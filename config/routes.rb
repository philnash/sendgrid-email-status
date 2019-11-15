Rails.application.routes.draw do
  resources :emails, only: [:new, :create, :show]
  get '/emails', to: redirect('/')
  root to: 'emails#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
