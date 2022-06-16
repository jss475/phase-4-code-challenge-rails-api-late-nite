class EpisodesController < ApplicationController
    def index
        render json: Episode.all, status: :ok
    end

    def show
        episode = Episode.find_by(id: params[:id])
        if episode
            render json: episode, status: :ok, serializer: EpisodeGuestSerializer   
        else
            render json: {error: "Episode not found"}, status: :not_found
        end
    end

    def destroy
        episode = Episode.find_by(id: params[:id])
        if episode
            episode.appearances.destroy_all
            episode.destroy
            render json: {}, status: 204
        else
            render json: {error: "Episode not found"}, status: :not_found
        end
    end
end
