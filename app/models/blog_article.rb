class BlogArticle < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 300 }
  # validates :content, presence: true
  validates :date, presence: true

  has_many_attached :photos
  has_rich_text :rich_content

  acts_as_taggable_on :tags
  # acts_as_taggable_on :performance, :santé, :bienêtre, :entrepreunariat, :mental, :entreprise

  # scope :order_by_date, -> { order(date: :desc) }
end
