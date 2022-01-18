class AppearancesController < ApplicationController

    def create 
        appearance = Appearance.create!(appearance_params)
        render json: appearance, status: :created
    rescue ActiveRecord::RecordInvalid => invalid 
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity 
    end

    private

    def appearance_params
        params.permit(:id, :rating, :episode_id, :guest_id)
    end
end
