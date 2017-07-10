class RealizarSorteo

  def realizar_sorteo(premio_id)
    sorteos = set_sorteos(premio_id)

    define_winner(sorteos)
  end

  private

  def set_sorteos(premio_id)
    Sorteo.where(premio_id: premio_id)
  end

  def define_winner(sorteos)
    offset = rand(sorteos.count)

    winner = sorteos.offset(offset).first

    create_ganadores_sorteos(winner)
  end

  def create_ganadores_sorteos(winner)
    GanadoresSorteo.create(sorteo_id: winner.id)

    entregar_premio(winner)
  end

  def entregar_premio(winner)
    winner.premio.entregar_premio
  end
end
