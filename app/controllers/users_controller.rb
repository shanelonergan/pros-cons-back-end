require 'dotenv'
Dotenv.load

class UsersController < ApplicationController
    def create

    end

    def show

    end

    def update

    end

    def destroy

    end

    private

    user_params = params.permit(:username)
end
