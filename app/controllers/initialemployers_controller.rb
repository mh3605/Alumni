class InitialemployersController < ApplicationController
  before_action :set_initialemployer, only: [:show, :edit, :update, :destroy]

  # GET /initialemployers
  # GET /initialemployers.json
  def index
    @initialemployers = Initialemployer.all
  end

  # GET /initialemployers/1
  # GET /initialemployers/1.json
  def show
  end

  # GET /initialemployers/new
  def new
    @initialemployer = Initialemployer.new
  end

  # GET /initialemployers/1/edit
  def edit
  end

  # POST /initialemployers
  # POST /initialemployers.json
  def create
    @initialemployer = Initialemployer.new(initialemployer_params)

    respond_to do |format|
      if @initialemployer.save
        format.html { redirect_to @initialemployer, notice: 'Initialemployer was successfully created.' }
        format.json { render :show, status: :created, location: @initialemployer }
      else
        format.html { render :new }
        format.json { render json: @initialemployer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /initialemployers/1
  # PATCH/PUT /initialemployers/1.json
  def update
    respond_to do |format|
      if @initialemployer.update(initialemployer_params)
        format.html { redirect_to @initialemployer, notice: 'Initialemployer was successfully updated.' }
        format.json { render :show, status: :ok, location: @initialemployer }
      else
        format.html { render :edit }
        format.json { render json: @initialemployer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /initialemployers/1
  # DELETE /initialemployers/1.json
  def destroy
    @initialemployer.destroy
    respond_to do |format|
      format.html { redirect_to initialemployers_url, notice: 'Initialemployer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_initialemployer
      @initialemployer = Initialemployer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def initialemployer_params
      params.require(:initialemployer).permit(:name)
    end
end
