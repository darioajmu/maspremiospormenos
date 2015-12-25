class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_usuario!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :tiposdocumento_id, :documento, :username, :nombre, :apellido1, :apellido2, :provincia_id, :ciudad, :codigopostal, :direccion, :direccioncompleta, :fechadenacimiento, :movil, :sexo) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :provincia_id, :ciudad, :codigopostal, :direccion, :direccioncompleta, :fechadenacimiento, :movil) }
    end

end
