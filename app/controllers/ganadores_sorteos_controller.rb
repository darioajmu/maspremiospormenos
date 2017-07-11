class GanadoresSorteosController < ApplicationController
  load_and_authorize_resource

  def index
    @ganadores_sorteos = GanadoresSorteo.order('created_at')
  end
end
