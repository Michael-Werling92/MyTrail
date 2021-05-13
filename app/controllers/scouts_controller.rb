class ScoutsController < ApplicationController
    
    before_action :find_scout, only: [:show, :edit, :update, :destroy]
    
    def index
        @scouts = Scout.all
    end
    def show
    end

    def new
        @scout = Scout.new
        3.times { @scout.trips.build }
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
    end
    def update
        @scout.update(scout_params)
        redirect_to scout_path(@scout)
    end


    private

    def find_scout
        @scout = Scout.find_by_id(params[:id])
    end
    def scout_params
        params.require(:scout).permit(:first_name, :last_name, :rank, :username, :password)
    end




end
