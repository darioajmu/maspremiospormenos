Rails.application.routes.draw do

  devise_for :usuarios
  root 'inicios#index'
  resources :inicios#, path: "inicio"
  resources :usuarios
end