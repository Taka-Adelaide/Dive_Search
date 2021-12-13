class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    gon.spots = @spots
    
    @areas = Area.all
  end

  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot
  end
end
