require 'dotenv'
Dotenv.load

class UsersController < ApplicationController
    def create
        user = User.create(user_params)

        if user.valid?
            user = user
            token = JWT.encode({user_id: user.id}, ENV[JWT_SECRET_KEY], 'HS256')
    end

    def show
        user = User.find_by(params[:id])
        render json: user
    end

    def update

    end

    def destroy

    end

    private

    def user_params
        params.permit(:username, :email, :password_digest)
    end
end
