Rails.application.routes.draw do
  devise_for :usuarios
  root 'inicios#index'
  resources :inicios#, path: "inicio"
  resources :premios
  resources :tipospremios
  resources :usuarios
end
