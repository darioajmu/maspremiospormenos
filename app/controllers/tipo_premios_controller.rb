class TipoPremiosController < ApplicationController
  def index
    @tipo_premios = TipoPremio.order(:nombre)
  end

  def new
    @tipo_premio = TipoPremio.new
  end
end
