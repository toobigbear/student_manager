class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
    @enrollments = @student.enrollments.includes(:course)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student, notice: "学生创建成功"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :age, :major)
  end
end