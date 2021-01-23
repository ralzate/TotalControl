Rails.application.routes.draw do
  root 'home#index'

  resources :users, :path => 'usuarios_registrados' 

  resources :people, :path => 'personas' do
    resources :records, :path => 'registros'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }



  get 'documentation', to: 'documentation#index'

  
end
