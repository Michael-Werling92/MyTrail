class BadgesController < ApplicationController
    def index
        @badges = Hobby.all
    end
    def show
        @badge = badge.find_by_id(params[:id])
    end 

end
