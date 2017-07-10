Rails.application.routes.draw do
  devise_for :usuarios
  root 'inicios#index'
  resources :inicios#, path: "inicio"
  resources :premios
  resources :tipo_premios
  resources :tipo_documentos
  resources :usuarios

  resources :sorteos, only: [:assign_participation] do
    collection do
      get :assign_participation
      get :sortear
    end
  end

  resources :participaciones do
    collection do
      get :solicitar
    end
  end
end
