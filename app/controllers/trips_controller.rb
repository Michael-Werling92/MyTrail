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
    def create
        if params[:scout_id]
            find_scout
            @trip = @scout.trips.build(trip_with_scout_params)
        else
            @trip = Trip.new(trip_params)
        end
            if @trip.save
                if @scout
                    redirect_to scout_trip_path(@scout, @trip)
                else
                    redirect_to @trip
                end
            else
            render :new
            end
    end 

end

private 


  def find_trip
      @trip = Trip.find_by_id(params[:id])
  end
     def trip_params
         params.require(:trip).permit(:location, :date)
     end 


  def find_scout
      @scout = Scout.find_by_id(params[:scout_id])
  end
     def trip_with_scout_params
         params.require(:trip).permit(:location, :date, :scout_id)
     end 