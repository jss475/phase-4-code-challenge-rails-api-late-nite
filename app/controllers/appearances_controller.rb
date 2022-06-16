class AppearancesController < ApplicationController
    def create
        appearance = Appearance.create(app_params)
        if appearance.valid?
            render json: appearance, status: :created
        else
            render json: {errors: ["validation errors"]}, status: :unprocessable_entity
        end
    end

    private
    def app_params
        params.permit(:rating, :episode_id, :guest_id)
    end

end
