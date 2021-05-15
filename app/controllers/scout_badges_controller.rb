class ScoutBadgesController < ApplicationController
    
    def index
            if params[:scout_id]
                @scout = Scout.find_by_id(params[:scout_id])
                @scout_badges = @scout.scout_badges.order(:date)
            else
                @scout_badges = ScoutBadge.all.order(:date)
            end
    end

    
    def new
        @scout_badge = ScoutBadge.new
        @scout = current_scout
        if logged_in?
        else
            redirect_to "/"
        end
    end
    def create
        @scout_badge = ScoutBadge.new(scout_badge_params)
        if @scout_badge.save
            redirect_to scout_badges_path
        else
            render :new
        end
    end
    
    private 


    def find_scout_badge
        @scout_badge = ScoutBadge.find_by_id(params[:id])
    end
    def find_scout
        @scout = Scout.find_by_id(params[:scout_id])
    end
    def scout_badge_params
        params.require(:scout_badge).permit(:fun, :date, :scout_id, :badge_id)
    end 

end
