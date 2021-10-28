class RoutesController < ApplicationController
    before_action :authenticate_user!, only: [:status]

    def home
    end

    def about
    end

    def gallery
    end

    def team
    end

    def status
    end
end
  