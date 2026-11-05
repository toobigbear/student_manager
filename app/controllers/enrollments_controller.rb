class EnrollmentsController < ApplicationController
  def index
    @enrollments = Enrollment.includes(:student, :course)
  end

  def new
    @student = Student.find(params[:student_id]) if params[:student_id]
    @course = Course.find(params[:course_id]) if params[:course_id]
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      redirect_to enrollments_path, notice: "选课成功"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    redirect_to enrollments_path, notice: "退课成功"
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id, :score)
  end
end