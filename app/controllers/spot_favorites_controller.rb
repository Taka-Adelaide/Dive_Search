class SpotFavoritesController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    favorite = current_user.spot_favorites.new(user_id: current_user.id, spot_id: @spot.id)
    favorite.save
    # redirect_to request.referer
  end

  def destroy
    @spot = Spot.find(params[:spot_id])
    favorite = current_user.spot_favorites.find_by(spot_id: @spot.id)
    favorite.destroy
    # redirect_to request.referer
  end

end
