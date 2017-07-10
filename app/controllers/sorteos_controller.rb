require 'premios_helper'

class SorteosController < ApplicationController
  include PremiosHelper

  skip_authorization_check

  def assign_participation
    premio = Premio.find(params["premio_id"])
    participaciones = Participacion.where(usuario_id: params["usuario_id"], usada: false)
    participaciones_restantes = set_missing_participations(premio)

    if participaciones_restantes > 0 && participaciones.any?
      participacion = participaciones.first

      create_sorteo(params["premio_id"], participacion.id)

      use_participacion(participacion)

      flash[:notice] = "Participacion anotada al premio."
    elsif participaciones_restantes <= 0
      flash[:alert] = "Este premio no admite más participaciones."
    elsif participaciones.blank?
      flash[:alert] = "No te quedan participaciones."
    end

    redirect_to :back
  end

  private

  def create_sorteo(premio_id, participacion_id)
    Sorteo.create(premio_id: premio_id, participacion_id: participacion_id)
  end

  def use_participacion(participacion)
    participacion.update(usada: true)
  end
end
