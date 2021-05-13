class ScoutsController < ApplicationController
    
    before_action :find_scout, only: [:show, :edit, :update, :destroy]
    
    def index
        @scouts = Scout.all
    end
    def show
    end

    def new
        @scout = Scout.new
    end
    def create
        @scout = Scout.new(scout_params)
        if @scout.save
            binding.pry
            session[:scout_id] = @scout.id
            redirect_to scout_path(@scout)
        else
            render :new
        end
    end


    private

    def find_scout
        @scout = Scout.find_by_id(params[:id])
    end
    def scout_params
        params.require(:scout).permit(:first_name, :last_name, :rank, :username, :password)
    end




end
