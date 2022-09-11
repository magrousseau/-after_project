class Podcast < ApplicationRecord
  has_many :guests

  validates :title, presence: true
  validates :description, presence: true
  #validates :link, presence: true
  validates :date, presence: true

  has_rich_text :rich_content
  has_many_attached :photos

  acts_as_taggable_on :tags

  scope :order_by_date, -> { order(date: :desc) }
end
