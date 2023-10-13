Rails.application.routes.draw do
  resources :espacios
  resources :tipo_viviendas
  resources :viviendas
  get 'admin/create_user'
  get 'admin/edit_user'

  root 'viviendas#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

    # Permisos del admin
    resources :admin, only: [:index, :new, :create, :update]
    # Ruta para crear usuarios
    post 'admin/create', to: 'admin#create', as: 'admin_create'

end
