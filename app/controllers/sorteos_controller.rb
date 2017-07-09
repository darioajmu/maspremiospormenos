class SorteosController < ApplicationController
  skip_authorization_check
  def assign_participation
    premio = Premio.find(params["premio_id"])
    participacions = Participacion.where(usuario_id: params["usuario_id"], usada: false)

    if premio.numero_participaciones > 0 && participacions.any?
      participacion = participacions.first
      Sorteo.create(premio_id: params["premio_id"], participacion_id: participacion.id)
      participacion.update(usada: true)
    end

    redirect_to :back
  end
end
