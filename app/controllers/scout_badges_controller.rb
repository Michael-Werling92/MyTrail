class ScoutBadgesController < ApplicationController
    
    def index
        @scout_badges = ScoutBadge.all
        if logged_in?
            render :index
        else
            redirect_to "/"
        end
    end
    
    def new
        @scout_badge = ScoutBadge.new
        @scout = current_scout
        if logged_in?
            render :new
        else
            redirect_to "/"
        end
    end
    def create
        @scout_badge = ScoutBadge.new(scout_badge_params)
        if @scout_badge.save
            binding.pry
            redirect_to scout_badge_path(@scout_badge)
        else
            render :new
        end
    end
    









    private 


    def find_scout_badge
        @scout_badge = ScoutBadge.find_by_id(params[:id])
    end
    def scout_badge_params
        params.require(:scout_badge).permit(:fun, :date, :scout_id, :badge_id)
    end 

end
