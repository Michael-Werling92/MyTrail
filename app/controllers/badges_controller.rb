class BadgesController < ApplicationController
    def index
        @badges = Badge.all.order(:name)
    end
    def show
        @badge = Badge.find_by_id(params[:id])
    end 

private
def badge_params
    params.require(:badge).permit(:name, :description, :eagle_Required)
end 


end
