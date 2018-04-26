Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'index#index'
  resources :volumes
  resources :archives

  post '/search', to: 'index#search'

end
