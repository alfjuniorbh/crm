class SchoolsController < ApplicationController
  def index
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path, notice: 'School registered successufull!'
    else
      render :new
    end
  end

  private

  def school_params
    params.require(:school).permit(:id, :name,:email,:website,:phone,:logo,:is_active)
  end

end
