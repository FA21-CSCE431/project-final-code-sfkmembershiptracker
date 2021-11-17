class RoutesController < ApplicationController
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
end
