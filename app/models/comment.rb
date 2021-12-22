class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many :comment_favorites

  attachment :image

  validates :comment, presence: true

  def favorited_by?(current_user)
    comment_favorites.where(user_id: current_user.id).exists?
  end
end
