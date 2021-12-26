class Spot < ApplicationRecord
  has_many :spot_favorites
  has_many :comments
  belongs_to :area

  validates :name, presence: true
  validates :caption, presence: true
  validates :has_beach, presence: true
  validates :has_boat, presence: true
  validates :for_beginners, presence: true
  validates :latitude, presence: true
  validates :longtitude, presence: true
  validates :is_active, presence: true

  def favorited_by?(current_user)
    spot_favorites.where(user_id: current_user.id).exists?
  end

  def self.search(keyword)
    where(["name like? OR caption like?", "%#{keyword}%", "%#{keyword}%"])
  end
  
  def custom_validate
    if condition
      errors.add(:base, "入力してください")
    end
  end
end
