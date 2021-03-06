module PremiosHelper
  def set_missing_participations(premio)
    (premio.numero_participaciones) - (Sorteo.where(premio_id: premio.id).size)
  end
    def set_my_participations(premio)
      Sorteo.where(participacion_id: current_usuario.participaciones.ids, premio_id: premio.id).size
    end

  def link_to_assign(premio)
    set_missing_participations(premio) > 0 ? "link_to 'Añadir', assign_participation_sorteos_path(premio_id: premio.id)" : ""
  end

  def link_to_raffle(premio)
    set_missing_participations(premio) == 0 ? "link_to 'Sortear', sortear_sorteos_path(premio_id: premio.id), data: {confirm: '¿Estás seguro?'}" : ""
  end
end
