class SpotFavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @spot = Spot.find(params[:spot_id])
    favorite = current_user.spot_favorites.new(user_id: current_user.id, spot_id: @spot.id)
    favorite.save
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    favorite = current_user.spot_favorites.find_by(spot_id: @spot.id)
    favorite.destroy
  end
end
