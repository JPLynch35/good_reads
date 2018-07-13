class Book < ApplicationRecord
  validates_presence_of :title
  has_many :reviews
  has_many :users, through: :reviews

  def average_review_rating
    reviews.average(:rating)
  end

  def max_rating
    reviews.maximum(:rating)
  end
end
