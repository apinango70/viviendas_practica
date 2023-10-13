class ViviendasController < ApplicationController
  before_action :set_vivienda, only: %i[ show edit update destroy ]
  before_action :authorize_user!, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  # GET /viviendas or /viviendas.json
  def index
    @viviendas = Vivienda.all
  end

  # GET /viviendas/1 or /viviendas/1.json
  def show
  end

  # GET /viviendas/new
  def new
    @vivienda = Vivienda.new
  end

  # GET /viviendas/1/edit
  def edit
  end

  # POST /viviendas or /viviendas.json
  def create
    @vivienda = current_user.viviendas.build(vivienda_params)

    respond_to do |format|
      if @vivienda.save
        format.html { redirect_to vivienda_url(@vivienda), notice: "Vivienda was successfully created." }
        format.json { render :show, status: :created, location: @vivienda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vivienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viviendas/1 or /viviendas/1.json
  def update
    respond_to do |format|
      if @vivienda.update(vivienda_params)
        format.html { redirect_to vivienda_url(@vivienda), notice: "Vivienda was successfully updated." }
        format.json { render :show, status: :ok, location: @vivienda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vivienda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viviendas/1 or /viviendas/1.json
  def destroy
    @vivienda.destroy

    respond_to do |format|
      format.html { redirect_to viviendas_url, notice: "Vivienda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vivienda
      @vivienda = Vivienda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vivienda_params
      params.require(:vivienda).permit(:user_id, :superficie, :direccion, :tipo_vivienda_id, espacio_ids: [])
    end

    def authorize_user!
      # Solo permite que el administrador o el creador de la vivienda realicen acciones de edición y eliminación
      unless current_user.admin? || current_user == @vivienda.user
        redirect_to root_path, alert: "No tienes permisos para realizar esta acción."
      end
    end

end
