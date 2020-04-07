class UsersController < ApplicationController
    def create

    end

    private

    user_params = params.permit(:username)
end
