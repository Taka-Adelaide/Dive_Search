class Spot < ApplicationRecord
  has_many :spot_favorites
  has_many :comments
  belongs_to :area
end
