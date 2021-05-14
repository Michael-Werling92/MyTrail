class BadgesController < ApplicationController
    def index
        @badges = Badge.all
    end
    def show
        @badge = badge.find_by_id(params[:id])
    end 

end
