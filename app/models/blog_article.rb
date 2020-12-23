class BlogArticle < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
  validates :date, presence: true

  has_many_attached :photos

  # scope :order_by_date, -> { order(date: :desc) }
end
