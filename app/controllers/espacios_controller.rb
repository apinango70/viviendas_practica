class EspaciosController < ApplicationController
  before_action :set_espacio, only: %i[ show edit update destroy ]

  # GET /espacios or /espacios.json
  def index
    @espacios = Espacio.all
  end

  # GET /espacios/1 or /espacios/1.json
  def show
  end

  # GET /espacios/new
  def new
    @espacio = Espacio.new
  end

  # GET /espacios/1/edit
  def edit
  end

  # POST /espacios or /espacios.json
  def create
    @espacio = Espacio.new(espacio_params)

    respond_to do |format|
      if @espacio.save
        format.html { redirect_to espacio_url(@espacio), notice: "Espacio was successfully created." }
        format.json { render :show, status: :created, location: @espacio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @espacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /espacios/1 or /espacios/1.json
  def update
    respond_to do |format|
      if @espacio.update(espacio_params)
        format.html { redirect_to espacio_url(@espacio), notice: "Espacio was successfully updated." }
        format.json { render :show, status: :ok, location: @espacio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @espacio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /espacios/1 or /espacios/1.json
  def destroy
    @espacio.destroy

    respond_to do |format|
      format.html { redirect_to espacios_url, notice: "Espacio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_espacio
      @espacio = Espacio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def espacio_params
      params.require(:espacio).permit(:nombre)
    end
end
