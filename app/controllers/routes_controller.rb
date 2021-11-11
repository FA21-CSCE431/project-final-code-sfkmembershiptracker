class RoutesController < ApplicationController
    def home
    end

    def about
    end

    def social_media
    end

    def team
        @team = Member.where("position_id = 2")
    end

    def dashboard
    end

end
