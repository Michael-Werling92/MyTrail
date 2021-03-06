class TripsController < ApplicationController

    before_action :find_trip, only: [:show, :edit, :update, :destroy]

    def index
        if params[:scout_id]
           find_scout
           @trips = @scout.trips.order(date: :desc)
        else
           @trips = Trip.chrono
           @current_scout= Scout.find_by_id(session[:scout_id])
        end
    end
    def show
    end

    def new
        if params[:scout_id]
           find_scout
           @trip = @scout.trips.build
        else
           @trip = Trip.new
           @current_scout= Scout.find_by_id(session[:scout_id])
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

    def edit
    end
    def update
    end
  
  
    def destroy
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

end