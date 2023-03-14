class AuthenticationController < ApplicationController
    skip_before_action :authentication_request

    def login
        student = Student.find_by_email(params[:email])
        if student.authenticate(params[:password])
            token = jwt_encode(student_id: student.id)
            render json: {token: token} , status: :ok
        else
            render json: {erro: "unauthorized"}
        end
    end

end
