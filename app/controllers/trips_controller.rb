class TripsController < ApplicationController

    def index
        if params[:scout_id]
           find_scout
           @trips = @scout.trips
         else
           @trips = Trip.all
        end
    end
    def show
        if params[:scout_id] 
            find_scout
        end
    end

    def new
        if params[:scout_id]
           find_scout
           @trip = @scout.trips.build
        else
           @trip = Trip.new 
        end
    end

end
