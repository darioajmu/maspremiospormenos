Rails.application.routes.draw do

  get 'welcome/index'
  root 'inicios#index'
  resources :inicios#, path: "inicio"
end
