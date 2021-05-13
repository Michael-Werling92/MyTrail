class SessionsController < ApplicationController
    def new
    end
    def create
        @scout = Scout.find_by(username: params[:username])
        if @scout && @scout.authenticate(params[:password])
            session[:scout_id] = @scout.id
            redirect_to scout_path(@scout)
        else
            redirect_to login_path
        end
    end

    def login
    end
    def destroy
        session.clear
        redirect_to login_path   
    end

end
