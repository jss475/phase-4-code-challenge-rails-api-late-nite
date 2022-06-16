class GuestsController < ApplicationController
    
    def index
        render json: Guest.all, status: :ok
    end

end
