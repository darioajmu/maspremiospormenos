Rails.application.routes.draw do
  devise_for :usuarios, controllers: { registrations: "usuarios/registrations" }
  root 'inicios#index'
  resources :inicios#, path: "inicio"
  resources :usuarios
end
