class TipoPremiosController < ApplicationController
  load_and_authorize_resource
  def index
    @tipo_premios = TipoPremio.order(:nombre)
  end

  def new
    @tipo_premio = TipoPremio.new
  end

  def create
    respond_to do |format|
      if @tipo_premio.save
        format.html { redirect_to tipo_premios_path, notice: 'El Tipo de premio fue creado correctamente.' }
        format.json { render :show, status: :created, location: @tipo_premio }
      else
        format.html { render :new }
        format.json { render json: @tipo_premio.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def tipo_premio_params
    params.require(:tipo_premio).permit(:nombre, :codigo)
  end
end
