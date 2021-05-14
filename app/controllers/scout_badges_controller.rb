class ScoutBadgesController < ApplicationController
    def new
        @scout_badge = ScoutBadge.new
    end
    









    private 


    def find_scout_badge
        @scout_badge = ScoutBadge.find_by_id(params[:id])
    end
    def scout_badge_params
        params.require(:scout_badge).permit(:fun, :date, :user_id, :hobby_id)
    end 

end
