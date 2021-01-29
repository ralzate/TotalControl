Rails.application.routes.draw do
  get 'reports/index'
  root 'home#index'

  resources :users, :path => 'usuarios_registrados' 
  resources :records, :path => 'registros'

  resources :people, :path => 'personas' do
    resources :records, :path => 'registros'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  get 'print_records', to: 'reports#records_xls'
  get 'print_people', to: 'reports#people_xls'
  get 'print_users', to: 'reports#users_xls'


  get 'reportes', to: 'reports#index'
  get 'reporte_usuarios', to: 'reports#users_pdf'
  get 'reporte_personas', to: 'reports#people_pdf'
  get 'reporte_registros', to: 'reports#records_pdf'

  get 'documentation', to: 'documentation#index'

end
