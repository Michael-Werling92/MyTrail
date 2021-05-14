class ScoutBadgesController < ApplicationController
    def index
        @scout_badges = ScoutBadge.all
    end

end
