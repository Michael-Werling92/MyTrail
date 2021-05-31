class ScoutsController < ApplicationController
    
    before_action :find_scout, only: [:edit, :update, :destroy]
    
    def index
        if params[:search]
          search_term = params[:search].downcase.gsub(/\s+/, "")
          @scouts = Scout.all.select{ |scout| 
            scout.first_name.downcase.include?(search_term) || 
            scout.last_name.downcase.include?(search_term) || 
            scout.username.downcase.include?(search_term)
            scout.rank.downcase.include?(search_term)}
        else
          @scouts = Scout.all
        end 
    end
    def show
        if logged_in?
            if params[:id] 
            find_scout
            end
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
