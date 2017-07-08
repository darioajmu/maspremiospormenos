Rails.application.routes.draw do
  devise_for :usuarios
  root 'inicios#index'
  resources :inicios#, path: "inicio"
  resources :premios
  resources :tipo_premios
  resources :usuarios
end
