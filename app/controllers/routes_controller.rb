class RoutesController < ApplicationController
    before_action :authenticate_user!, only: [:status]

    def home
    end

    def about
    end

    def social_media
    end

    def team
      @team = Member.where("position_id = '3'")
      @team = Member.all
    end

    def status
    end
end
