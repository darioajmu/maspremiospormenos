class PremiosController < ApplicationController
  load_and_authorize_resource

  def index
    @premios = Premio.where(estado: Premio::DISPONIBLE)
  end

  def no_disponibles
    @premios = Premio.where(estado: Premio::NO_DISPONIBLE)
  end

  def completos
    @premios = Premio.where(estado: Premio::COMPLETO)
  end

  def create
    respond_to do |format|
      if @premio.save
        format.html { redirect_to no_disponibles_premios_path, notice: 'El Premio fue creado correctamente.' }
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
        format.html { redirect_to no_disponibles_premios_path, notice: 'El Premio fue editado correctamente.' }
        format.json { render :show, status: :created, location: @premio }
      else
        format.html { render :new }
        format.json { render json: @premio.errors, status: :unprocessable_entity }
      end
    end
  end

  def publicar
    @premio = Premio.find(params["id"])

    @premio.premio_disponible

    flash[:notice] = "Premio correctamente publicado."
    redirect_to premios_path
  end

  private

  def premio_params
    params.require(:premio).permit(:nombre, :codigo, :fecha_hora_sorteo, :numero_participaciones, :tipo_premio_id)
  end
end
