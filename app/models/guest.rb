class Guest < ApplicationRecord
  has_many :podcast_invitations, dependent: :destroy
  has_many :podcasts, through: :podcast_invitations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
end
