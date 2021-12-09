class SpotsController < ApplicationController
  def index
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
