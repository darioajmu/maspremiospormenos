class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    not_authorized(exception.message)
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_usuario!
  check_authorization unless: :devise_controller?

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def current_user
    return current_usuario
  end

  def not_authorized(message)
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, :alert => message }
    end
  end

  protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :tipo_documento_id, :documento, :username, :nombre, :apellido1, :apellido2, :provincia_id, :ciudad, :codigopostal, :direccion, :direccioncompleta, :fechadenacimiento, :movil, :sexo) }
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
        devise_parameter_sanitizer.for(:sign_out) { |u| u.permit(:login, :username, :email) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password, :provincia_id, :ciudad, :codigopostal, :direccion, :direccioncompleta, :fechadenacimiento, :movil) }
    end

end
