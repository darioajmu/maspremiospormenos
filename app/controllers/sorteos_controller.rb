require 'premios_helper'

class SorteosController < ApplicationController
  include PremiosHelper

  authorize_resource

  def assign_participation
    premio = Premio.find(params["premio_id"])
    participaciones = Participacion.where(usuario_id: current_usuario.id, usada: false)
    participaciones_restantes = set_missing_participations(premio)

    if participaciones_restantes > 0 && participaciones.any?
      participacion = participaciones.first

      create_sorteo(params["premio_id"], participacion.id)

      mark_participacion_as_used(participacion)

      premio.premio_completo if participaciones_restantes == 1

      flash[:notice] = "Participacion anotada al premio."
    elsif participaciones_restantes <= 0
      flash[:alert] = "Este premio no admite más participaciones."
    elsif participaciones.blank?
      flash[:alert] = "No te quedan participaciones."
    end

    redirect_to :back
  end

  def sortear
    premio = Premio.find(params["premio_id"])
    participaciones_restantes = set_missing_participations(premio)

    if premio.completo?
      RealizarSorteo.new.realizar_sorteo(params["premio_id"])
      flash[:notice] = "Sorteo Realizado. Búscalo en la pestaña 'Sorteos Finalizados'"
    elsif participaciones_restantes > 0
      flash[:notice] = "No se puede realizar el Sorteo por qué aún quedan participaciones"
    end

    redirect_to :back
  end

  private

  def create_sorteo(premio_id, participacion_id)
    Sorteo.create(premio_id: premio_id, participacion_id: participacion_id)
  end

  def mark_participacion_as_used(participacion)
    participacion.make_participation_used
  end
end
