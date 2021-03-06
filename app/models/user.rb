class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  enum rank: { non_diver: 0, OW: 1, AOW: 2, RD: 3, MSD: 4, DM: 5, IA: 6}

  has_many :comments, dependent: :destroy
  has_many :comment_favorites
  has_many :spot_favorites

  validates :user_name, presence: true
  validates :name, presence: true
end
