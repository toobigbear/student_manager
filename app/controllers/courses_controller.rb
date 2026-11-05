class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @enrollments = @course.enrollments.includes(:student)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course, notice: "课程创建成功"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :credit)
  end
end