class TipoDocumentosController < ApplicationController
load_and_authorize_resource

  def create
    respond_to do |format|
      if @tipo_documento.save
        format.html { redirect_to tipo_documentos_path, notice: 'El Tipo de documento fue creado correctamente.' }
        format.json { render :show, status: :created, location: @tipo_documento }
      else
        format.html { render :new }
        format.json { render json: @tipo_documento.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def index
  end

  def new
  end

  def update
  end

  private

  def tipo_documento_params
    params.require(:tipo_documento).permit(:nombre, :codigo)
  end
end
