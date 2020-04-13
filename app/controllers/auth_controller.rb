require 'dotenv'
Dotenv.load

class AuthController < ApplicationController
    def login
        user = User.find_by(username: auth_params[:username])

        if user && user.authenticate(auth_params[:password])
            token = JWT.encode({user_id: user.id}, ENV['JWT_SECRET_KEY'], 'HS256')
            render json: {user: user, token: token}
        else
            render json: {errors: ["🛑 User Not Found 🛑"]}, status: :unprocessable_entity
        end
    end

    def persist
        if request.headers['Authorization']
            encoded_token = request.headers['Authorization'].split(' ')[1]
            token = JWT.encode(encoded_token, ENV[JWT_SECRET_KEY])
            user_id = token[0]['user_id']
            user = User.find(user_id)
            render json: user
        end
    end

    private

    def auth_params
        params.permit(:username, :password, :name, :auth)
    end
end
