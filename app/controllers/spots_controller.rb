class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    gon.spots = @spots

    @areas = Area.includes(:spots)

    # @comments = Comment.all
    @comments = Comment.includes(:user, :spot).page(params[:page]).reverse_order
  end

  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot

    # @comments = @spot.comments.all
    @comments = @spot.comments.includes(:user).page(params[:page]).reverse_order
    @user = current_user
  end
end

