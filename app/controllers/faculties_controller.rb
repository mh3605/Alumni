class FacultiesController < ApplicationController
  #load_and_authorize_resource
  #skip_authorize_resource :only => [:show, :index]
  #before_filter :authenticate_user!, :except => [:index, :show]
  #before_action :set_faculty, only: [:show, :edit, :update, :destroy]
 
  # GET /faculties
  # GET /faculties.json
  def index
    @faculties = Faculty.all
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
    @faculty = Faculty.find(params[:id])
    @alums= @faculty.alums
  end

  # GET /faculties/new
   pre{current_user.admin?}
  def new
    @faculty = Faculty.new
    #authorize! :create, Faculty
  end

  # GET /faculties/1/edit
  pre{current_user.admin? || current_user.getFaculty== Faculty.find(params[:id])}
  def edit
    @faculty = Faculty.find(params[:id])
    #authorize! :update, @faculty
  end

  # POST /faculties
   pre{current_user.admin?}
  # POST /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)
    #authorize! :create, Faculty
    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, notice: 'Faculty was successfully created.' }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  pre{current_user.admin? || current_user.getFaculty== Faculty.find(params[:id])}
  def update
    @faculty = Faculty.find(params[:id])
    #authorize! :update, @faculty
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty, notice: 'Faculty was successfully updated.' }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  pre{current_user.admin? || current_user.getFaculty== Faculty.find(params[:id])}
  def destroy
    @faculty = Faculty.find(params[:id])
    #authorize! :edit, @faculty
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url, notice: 'Faculty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faculty
      @faculty = Faculty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faculty_params
      params.require(:faculty).permit(:name, :email, :uid, :department_id, :researcharea_id, :about)
    end
end
