class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    gon.spots = @spots

    @areas = Area.all

    @comments = Comment.all
  end

  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot

    @comments = @spot.comments.all
    @user = current_user
  end
end

