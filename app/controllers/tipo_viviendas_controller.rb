class TipoViviendasController < ApplicationController
  before_action :set_tipo_vivienda, only: %i[ show edit update destroy ]

  # GET /tipo_viviendas or /tipo_viviendas.json
  def index
    @tipo_viviendas = TipoVivienda.all
  end

  # GET /tipo_viviendas/1 or /tipo_viviendas/1.json
  def show
  end

  # GET /tipo_viviendas/new
  def new
    @tipo_vivienda = TipoVivienda.new
  end

  # GET /tipo_viviendas/1/edit
  def edit
  end

  # POST /tipo_viviendas or /tipo_viviendas.json
  def create
    @tipo_vivienda = TipoVivienda.new(tipo_vivienda_params)

    respond_to do |format|
      if @tipo_vivienda.save
        format.html { redirect_to tipo_vivienda_url(@tipo_vivienda), notice: "Tipo vivienda was successfully created." }
        format.json { render :show, status: :created, location: @tipo_vivienda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_vivienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_viviendas/1 or /tipo_viviendas/1.json
  def update
    respond_to do |format|
      if @tipo_vivienda.update(tipo_vivienda_params)
        format.html { redirect_to tipo_vivienda_url(@tipo_vivienda), notice: "Tipo vivienda was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_vivienda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_vivienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_viviendas/1 or /tipo_viviendas/1.json
  def destroy
    @tipo_vivienda.destroy

    respond_to do |format|
      format.html { redirect_to tipo_viviendas_url, notice: "Tipo vivienda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_vivienda
      @tipo_vivienda = TipoVivienda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_vivienda_params
      params.require(:tipo_vivienda).permit(:nombre)
    end
end
