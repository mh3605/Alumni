class ResearchareasController < ApplicationController
  before_action :set_researcharea, only: [:show, :edit, :update, :destroy]


  # GET /researchareas
  # GET /researchareas.json
  def index
    @researchareas = Researcharea.all
    @heading= "Research Areas"
  end

  # GET /researchareas/1
  # GET /researchareas/1.json
  def show
	  @alums= @researcharea.alums
  end

  # GET /researchareas/new
  def new
    @researcharea = Researcharea.new
  end

  # GET /researchareas/1/edit
  def edit
  end

  # POST /researchareas
  # POST /researchareas.json
  def create
    @researcharea = Researcharea.new(researcharea_params)

    respond_to do |format|
      if @researcharea.save
        format.html { redirect_to @researcharea, notice: 'Researcharea was successfully created.' }
        format.json { render :show, status: :created, location: @researcharea }
      else
        format.html { render :new }
        format.json { render json: @researcharea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /researchareas/1
  # PATCH/PUT /researchareas/1.json
  def update
    respond_to do |format|
      if @researcharea.update(researcharea_params)
        format.html { redirect_to @researcharea, notice: 'Researcharea was successfully updated.' }
        format.json { render :show, status: :ok, location: @researcharea }
      else
        format.html { render :edit }
        format.json { render json: @researcharea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /researchareas/1
  # DELETE /researchareas/1.json
  def destroy
    @researcharea.destroy
    respond_to do |format|
      format.html { redirect_to researchareas_url, notice: 'Researcharea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_researcharea
      @researcharea = Researcharea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def researcharea_params
      params.require(:researcharea).permit(:name)
    end
end
