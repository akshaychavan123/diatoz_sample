class StudentsController < ApplicationController
    before_action :set_student , except: %i[index create new]
    def index
        students = Student.all
        render json: {message: "students showing successfully " , data: students} , status: :ok
    end
    def create
        student = Student.new(student_params)
        if student.save
            render json: {message: "student saved successfully " , data: student} , status: :ok
        else
            render json: {error: "unprocessable entity"}
        end

    end
     def show
        student = Student.find(params[:id])
      render json: student
     end
     private
     def set_student
        student = Student.find(params[:id])
     end
end
