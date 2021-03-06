class ListsController < ApplicationController
    def show
        list = List.find(params[:id])
        render json: list
    end

    def create

        list = List.create(list_params)

        # byebug

        if list.valid?
            render json: list
        else
            render json: {errors: list.errors.full_messages}
        end
    end

    def index
        render json: Listing.all
    end

    private

    def list_params
        params.permit(:list, :name, :user_id)
    end
end
