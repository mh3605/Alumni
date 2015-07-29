class AlumsController < ApplicationController
	#load_and_authorize_resource
  #skip_authorize_resource :only => [:show, :index]
  before_filter :authenticate_user!, :except=> [:index, :show]   
  #before_action :set_alum, only: [:show, :edit, :update, :destroy]

  # GET /alums
  # GET /alums.json
  pre{true}
  def index
    @alums = Alum.all
  end

  # GET /alums/1
  # GET /alums/1.json
  def show
    @alum = Alum.find(params[:id])
  end

  # GET /alums/new
  #pre{current_user.admin?}
  def new
    @alum = Alum.new
    authorize! :create, Alum
  end

  # GET /alums/1/edit
  def edit
    @alum = Alum.find(params[:id])
    authorize! :update, @alum
  end

  # POST /alums
  # POST /alums.json
  def create
    @alum = Alum.new(alum_params)
        authorize! :create, Alum

    respond_to do |format|
      if @alum.save
        format.html { redirect_to @alum, notice: 'Alum was successfully created.' }
        format.json { render :show, status: :created, location: @alum }
      else
        format.html { render :new }
        format.json { render json: @alum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alums/1
  # PATCH/PUT /alums/1.json
  def update
    @alum = Alum.find(params[:id])
      authorize! :update, @alum
    respond_to do |format|
      if @alum.update(alum_params)
        format.html { redirect_to @alum, notice: 'Alum was successfully updated.' }
        format.json { render :show, status: :ok, location: @alum }
      else
        format.html { render :edit }
        format.json { render json: @alum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alums/1
  # DELETE /alums/1.json
  def destroy
    @alum =Alum.find(params[:id])
    authorize! :edit, Alum
    @alum.destroy
    respond_to do |format|
      format.html { redirect_to alums_url, notice: 'Alum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alum
      #@alum = Alum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alum_params
      params.require(:alum).permit(:name,:uid,  :email, :phone, :faculty_id, :year_id,:department_id, :researcharea_id, :initialemployer_id, :about)
    end
end
