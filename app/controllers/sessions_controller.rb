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
        redirect to scout_path
    end
    def destroy
        session.clear
        redirect_to login_path   
    end

    def omniauth
        scout= Scout.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.username = auth['info']['email']
            u.first_name = auth['info']['first_name'] 
            u.last_name = auth['info']['last_name']
            u.password = SecureRandom.hex(12)
        end
        if scout.valid?
            session[:scout_id]= scout.id
            redirect_to scout_path(scout)
        else

            redirect_to '/login'
        end
    end

    private
        def auth
            request.env['omniauth.auth']
        end
end