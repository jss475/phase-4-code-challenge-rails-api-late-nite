class EpisodesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        render json: Episode.all 
    end

    def show
        render json: find_episode, serializer: EpisodeGuestSerializer
    end

    def destroy
        find_episode.destroy
        head :no_content
    end

    private

    def find_episode
        Episode.find(params[:id])
    end

    def render_not_found
        render json: { error: "Episode not found" }, status: :not_found
    end

end
