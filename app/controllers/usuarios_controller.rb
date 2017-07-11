class UsuariosController < ApplicationController
  load_and_authorize_resource

  def index
    @usuarios = Usuario.all.order('LOWER(username)')
  end

  def edit
  end

  def show
    @usuario = Usuario.find(params["id"])
  end

  def update
    if @usuario.update(usuario_params)
      redirect_to 'index'
    else
      render 'edit'
    end
  end

  private
  def usuario_params
    params.require(:usuario).permit(:username, :email, :encrypted_password, :password, :apellido1,
      :apellido2, :ciudad, :codigopostal, :nombre, :direccion, :direccioncompleta, :codigo, :documento,
      :fechadenacimiento, :movil, :provincia_id, :sexo, :tipo_documento_id, :password_confirmation)
  end
end
