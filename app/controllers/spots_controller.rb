class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    gon.spots = @spots

    @areas = Area.all

    # @comments = Comment.all
    @comments = Comment.page(params[:page]).reverse_order
  end

  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot

    # @comments = @spot.comments.all
    @comments = @spot.comments.page(params[:page]).reverse_order
    @user = current_user
  end
end

