Rails.application.routes.draw do
  root 'home#index'

  resources :users do
    resources :registries
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'documentation', to: 'documentation#index'

  
end
