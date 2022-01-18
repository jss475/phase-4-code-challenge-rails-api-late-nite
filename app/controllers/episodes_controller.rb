class EpisodesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 

    def index 
        render json: Episode.all 
    end

    def show
        episode = find_episode
        render json: episode, include: :guests
    end

    def destroy
        episode = find_episode
        episode.destroy
        head :no_content
    end

    private

    def find_episode
        Episode.find(params[:id])
    end

    def render_not_found_response
        render json: {error: "Episode not found"}, status: :not_found 
    end
end
