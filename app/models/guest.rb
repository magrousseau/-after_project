class Guest < ApplicationRecord
  belongs_to :podcast

  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :bio, presence: true

  has_one_attached :photo
end
