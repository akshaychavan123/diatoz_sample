class ApplicationController < ActionController::API
    include JsonWebToken
    before_action :authenticate_request
    def authenticate_request
        header = request.headers["Authorization"]
        header= heade.split(" ").last if header
        decoded = jwt_decode(header)
        @current_student = Student.find(decoded[:student_id])
    end
end
