class PremiosController < ApplicationController
  load_and_authorize_resource

  def index
    @premios = Premio.where(estado: Premio::DISPONIBLE)
  end

  def create
    respond_to do |format|
      if @premio.save
        format.html { redirect_to premios_path, notice: 'El Premio fue creado correctamente.' }
        format.json { render :show, status: :created, location: @premio }
      else
        format.html { render :new }
        format.json { render json: @premio.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @premio.update(premio_params)
        format.html { redirect_to premios_path, notice: 'El Premio fue editado correctamente.' }
        format.json { render :show, status: :created, location: @premio }
      else
        format.html { render :new }
        format.json { render json: @premio.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def premio_params
    params.require(:premio).permit(:nombre, :codigo, :fecha_hora_sorteo, :numero_participaciones, :tipo_premio_id)
  end
end
