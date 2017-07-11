Rails.application.routes.draw do
  devise_for :usuarios
  root 'premios#index'
  resources :tipo_premios
  resources :tipo_documentos
  resources :usuarios
  resources :ganadores_sorteos

  resources :sorteos, only: [:assign_participation] do
    collection do
      get :assign_participation
      get :sortear
    end
  end

  resources :premios do
    collection do
      get :no_disponibles
      get :completos
    end
    member do
      get :publicar
    end
  end

  resources :participaciones do
    collection do
      get :solicitar
    end
  end
end
