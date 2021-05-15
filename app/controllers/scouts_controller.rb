class ScoutsController < ApplicationController
    
    before_action :find_scout, only: [:edit, :update, :destroy]
    
    def index
        @scouts = Scout.all
        if logged_in?
        else
            redirect_to "/"
        end
    end
    def show
        if logged_in?
            @scout = Scout.find_by_id(params[:id])
            @current_scout = Scout.find_by_id(session[:scout_id])
        else
            redirect_to "/"
        end
    end

    def new
        @scout = Scout.new
    end
    def create
        @scout = Scout.new(scout_params)
        if @scout.save
            session[:scout_id] = @scout.id
            binding.pry
            redirect_to scout_path(@scout)
        else
            render :new
        end
    end

    def edit
        @current_scout = current_scout
    end
    def update
        @scout.update(scout_params)
        redirect_to scout_path(@scout)
    end

    def destroy
        @scout.destroy
        redirect_to "/"
    end

    private

    def find_scout
        @scout = Scout.find_by_id(params[:id])
    end
    def scout_params
        params.require(:scout).permit(:first_name, :last_name, :rank, :username, :password,
            trips_attributes: [:location, :date])
    end




end
