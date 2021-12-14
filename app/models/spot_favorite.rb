class SpotFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  
  def favorited_by?(current_user)
    spot_favorites.where(user_id: current_user.id).exists?
  end
end
