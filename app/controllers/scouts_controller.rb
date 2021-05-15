class ScoutsController < ApplicationController
    
    before_action :find_scout, only: [:edit, :update, :destroy]
    
    def index
        @scouts = Scout.all
    end
    def show
        binding.pry
        if params[:id] 
            @scout = Scout.find_by_id(params[:id])
        end
    end

    def new
        @scout = Scout.new
    end
    def create
        @scout = Scout.new(scout_params)
        if @scout.save
            session[:scout_id] = @scout.id
            redirect_to scout_path(@scout)
        else
            render :new
        end
    end

    def edit
        if logged_in? && params[:scout_id]=current_scout.id
            find_scout
        else
            redirect_to "/"
        end
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
