class ScoutsController < ApplicationController
    def index
        @scouts = Scout.all
    end
    def show
    end

    def new
        @scout = Scout.new
    end
end
