class BadgesController < ApplicationController
    def index
        @badges = Badge.all.order(:name)
    end
    def show
        binding.pry
        @badge = Badge.find_by_name(params[:id])
    end 

private
def badge_params
    params.require(:badge).permit(:name, :description, :eagle_Required)
end 


end
