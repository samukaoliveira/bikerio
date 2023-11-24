class ApisController < ApplicationController
  before_action :set_api, only: %i[ show edit update destroy ]


  def mapear
    # bike_rio_service = BikeRioService.new
    # @bicicletarios = bike_rio_service.localizar_bicicletarios

    # b1 = bicicletarios.first


    # @open_maps = bike_rio_service.get_mapa(b1['latitude'], b1['longitude'])

    tomtom_service = TomtomService.new
    @latitude = -22.8808
    @longitude = -43.1043
    @mapa = tomtom_service.get_mapa(@latitude, @longitude)

    #send_data @mapa, type: 'image/png', disposition: 'inline'
    render 'mapear'
  end

  # GET /apis or /apis.json
  def index
    @apis = Api.all
    
  end

  # GET /apis/1 or /apis/1.json
  def show
  end

  # GET /apis/new
  def new
    @api = Api.new
  end

  # GET /apis/1/edit
  def edit
  end

  # POST /apis or /apis.json
  def create
    @api = Api.new(api_params)

    respond_to do |format|
      if @api.save
        format.html { redirect_to api_url(@api), notice: "Api was successfully created." }
        format.json { render :show, status: :created, location: @api }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apis/1 or /apis/1.json
  def update
    respond_to do |format|
      if @api.update(api_params)
        format.html { redirect_to api_url(@api), notice: "Api was successfully updated." }
        format.json { render :show, status: :ok, location: @api }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1 or /apis/1.json
  def destroy
    @api.destroy!

    respond_to do |format|
      format.html { redirect_to apis_url, notice: "Api was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api
      @api = Api.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_params
      params.require(:api).permit(:latitude, :longitude, :endereco)
    end
end
