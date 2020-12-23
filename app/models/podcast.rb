class Podcast < ApplicationRecord
  has_many :podcast_invitations, dependent: :destroy
  has_many :guests, through: :podcast_invitations

  validates :title, presence: true
  validates :description, presence: true
  validates :link, presence: true
  validates :date, presence: true
end
