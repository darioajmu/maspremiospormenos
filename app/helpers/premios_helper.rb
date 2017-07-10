module PremiosHelper
  def set_missing_participations(premio)
    (premio.numero_participaciones) - (Sorteo.where(premio_id: premio.id).size)
  end

  def link_to_assign(premio)
    set_missing_participations(premio) > 0 ? "link_to 'Añadir', assign_participation_sorteos_path(premio_id: premio.id, usuario_id: current_usuario.id)" : ""
  end
end
