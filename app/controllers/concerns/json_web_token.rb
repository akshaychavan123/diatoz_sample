require 'jwt'

module JsonWebToken
    SECREAT_TOKEN = Rails.application.secret_key_base
    extend ActiveSupport::Concern
    def jwt_encode(payload , exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload , SECREAT_TOKEN)
    end

    def jwt_decode(token)
        decoded = JWT.decode(token , SECREAT_TOKEN)[0]
        HashWithDifferentAccess.new decoded
    end
end