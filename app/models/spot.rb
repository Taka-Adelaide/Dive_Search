class Spot < ApplicationRecord
  has_many :spot_favorites
  has_many :comments
  belongs_to :area

  validates :name, presence: true
  validates :caption, presence: true
  validates :latitude, presence: true
  validates :longtitude, presence: true
 

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
