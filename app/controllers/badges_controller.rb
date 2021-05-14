class BadgesController < ApplicationController
    def index
        @badges = Badge.all
    end
    def show
        @badge = Badge.find_by_id(params[:id])
    end 

end
