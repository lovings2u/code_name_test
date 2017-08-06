Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :themes, only: [:index, :show, :create, :new]
  post 'stages' => 'stages#show'
  get 'stages' => 'stages#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
