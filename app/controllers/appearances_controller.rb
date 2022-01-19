class AppearancesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_error

    def create 
        appearance = Appearance.create!(appearance_params)
        render json: appearance, status: :created
    end

    private

    def appearance_params
        params.permit(:episode_id, :guest_id, :rating)
    end

    def render_error(e)
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end

end
