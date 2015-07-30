class YearsController < ApplicationController
  #load_and_authorize_resource
  # skip_authorize_resource :only => [:show, :index]
  #before_filter :authenticate_user!, :except => [:index, :show]
  #before_action :set_year, only: [:show, :edit, :update, :destroy]

  # GET /years
  # GET /years.json
  def index
    @years = Year.all
  end

  # GET /years/1
  # GET /years/1.json
  def show
    @year = Year.find(params[:id])
  	@alums= @year.alums
  end

  # GET /years/new
  pre{current_user.admin?}
  def new
    @year = Year.new
    #authorize! :create, Year
  end

  # GET /years/1/edit
  pre{current_user.admin?}
  def edit
    @year = Year.find(params[:id])
    #authorize! :update, Year
  end

  # POST /years
  # POST /years.json
  pre{current_user.admin?}
  def create
    @year = Year.new(year_params)
    #authorize! :create, Year

    respond_to do |format|
      if @year.save
        format.html { redirect_to @year, notice: 'Year was successfully created.' }
        format.json { render :show, status: :created, location: @year }
      else
        format.html { render :new }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /years/1
  # PATCH/PUT /years/1.json
  pre{current_user.admin?}
  def update
    @year = Year.find(params[:id])
    #authorize! :update, Year
    respond_to do |format|
      if @year.update(year_params)
        format.html { redirect_to @year, notice: 'Year was successfully updated.' }
        format.json { render :show, status: :ok, location: @year }
      else
        format.html { render :edit }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /years/1
  # DELETE /years/1.json
  pre{current_user.admin?}
  def destroy
    @year = Year.find(params[:id])
    #authorize! :edit, Year
    @year.destroy
    respond_to do |format|
      format.html { redirect_to years_url, notice: 'Year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_year
      @year = Year.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def year_params
      params.require(:year).permit(:yr)
    end
end
