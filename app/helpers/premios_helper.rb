module PremiosHelper
  def set_missing_participations(premio)
    (premio.numero_participaciones) - (Sorteo.where(premio_id: premio.id).size)
  end
end
