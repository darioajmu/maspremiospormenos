class UsuariosController < ApplicationController
  before_action :objeto_find, only: [:edit, :show, :update, :destroy]

def edit
end

def update
  if @usuario.update(objeto_parametros)
    redirect_to 'index'
  else
    render 'edit'
  end
end

private
def objeto_find
	@usuario = Usuario.find(params[:id])
end

def objeto_parametros
	params.require(:usuario).permit(:username, :email, :encrypted_password, :password, :apellido1,
	 :apellido2, :ciudad, :codigopostal, :nombre, :direccion, :direccioncompleta, :codigo, :documento,
 	 :fechadenacimiento, :movil, :provincia_id, :sexo, :tiposdocumento_id, :password_confirmation)
end
end
