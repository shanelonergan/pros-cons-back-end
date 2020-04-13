require 'dotenv'
Dotenv.load

class UsersController < ApplicationController
    def create
        user = User.create(user_params)

        if user.valid?
            user = user
            token = JWT.encode({user_id: user.id}, ENV['JWT_SECRET_KEY'], 'HS256')
            render json: {user: user, token: token}
        else
            render json: {errors: user.errors.full_messages}
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    private

    def user_params
        params.permit(:username, :email, :password, :auth)
    end
end
