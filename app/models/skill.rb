class Skill < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  
  validates :title, presence: true
  validates :user_id, presence: true
end
