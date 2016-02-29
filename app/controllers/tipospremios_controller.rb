class TipospremiosController < ApplicationController
  def index
    @tipospremios=Tipospremio.order(:nombre)
  end

  def new
    @tipospremio=Tipospremio.new
  end
end
