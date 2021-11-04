class RoutesController < ApplicationController
    before_action :authenticate_user!, only: [:status]

    def home
    end

    def about
    end

    def social_media
    end

    def team
    end

    def status
    end
end
  