class SpotsController < ApplicationController
  def index
  end

  def show
    @spot = Spot.find(params[:id])
    gon.spot = @spot
  end
end
