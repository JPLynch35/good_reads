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

  def max_rating_user
    reviews.where(rating: reviews.maximum(:rating)).first.user.name
  end

  def max_rating_content
    reviews.where(rating: reviews.maximum(:rating)).first.content
  end
end
