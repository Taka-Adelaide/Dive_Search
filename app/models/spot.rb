class Spot < ApplicationRecord
  has_many :spot_favorites
  has_many :comments
  belongs_to :area

  def favorited_by?(user)
    comment_favorites.where(user_id: current_user.id).exists?
  end
end
