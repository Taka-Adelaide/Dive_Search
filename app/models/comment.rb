class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many :comment_favorites

  attachment :image
end
