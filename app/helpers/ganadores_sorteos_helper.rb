module GanadoresSorteosHelper

  def set_winner_name(ganador)
    "#{ganador.usuario.nombre} #{ganador.usuario.apellido1} #{ganador.usuario.apellido2}"
  end

    def set_prize_name(ganador)
      "#{ganador.premio.codigo} - #{ganador.premio.nombre}"
    end
end
