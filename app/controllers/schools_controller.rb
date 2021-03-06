class SchoolsController < ApplicationController
  before_action :authenticate_devise_school!, except: [:index]
  before_action :set_school, only: [:edit, :show, :update, :destroy]

  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School registered successufull!' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
  end

  def edit
  end

  def update
    if @school.update(school_params)
      redirect_to schools_path, notice: 'School updated successufull!'
    else
      render :edit
    end
  end

  def destroy
    if @school.destroy
      redirect_to schools_path, notice: 'School deleted successful!'
    else
      render :index
    end
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:id, :name,:email,:website,:phone,:logo,:is_active)
  end

end
