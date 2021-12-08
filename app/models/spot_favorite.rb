class SpotFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :spot, dependent: :destroy
end
