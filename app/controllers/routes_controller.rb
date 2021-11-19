class RoutesController < ApplicationController
  before_action :authenticate_user!, only: %i[help]
  before_action :check_member, only: %i[help]

  def home; end

  def about
    @info = SfkInfo.last
  end

  def social_media
    @info = SfkInfo.last
  end

  def team
    @team = Member.joins(:position).where('position.officer' => true).order(position: :desc)
  end

  def dashboard; end

  def help
    if !current_user.member.position.officer?
      redirect_to '/', alert: "You don't have permission to view this resource."
    end
  end
end
