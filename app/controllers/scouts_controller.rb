class ScoutsController < ApplicationController
    def index
        @scouts = Scout.all
    end
    def show
    end
end
