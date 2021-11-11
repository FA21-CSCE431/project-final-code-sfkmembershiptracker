class RoutesController < ApplicationController
    def home
    end

    def about
    end

    def social_media
    end

    def team
        @team = Member.joins(:position).where('position.officer' => true).order(position: :desc)
    end

    def dashboard
    end

end
