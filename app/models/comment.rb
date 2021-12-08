class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :spot
  has_many :comment_favorites
end
