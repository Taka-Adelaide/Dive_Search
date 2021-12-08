class CommentFavorite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :comment, dependent: :destroy
end
