class ParticipacionesController < ApplicationController
  authorize_resource
  def solicitar
    if current_usuario.admin? || params["usuario_id"].to_i == current_usuario.id
      (0..9).map { |number| Participacion.create(usuario_id: current_usuario.id)}
      redirect_to :back
    else
      not_authorized('You are not authorized to access this page.')
    end
  end
end
