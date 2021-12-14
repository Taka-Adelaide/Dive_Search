class CommentFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  # def favorited_by?(current_user)
  #   comment_favorites.where(user_id: current_user.id).exists?
  # end
end

