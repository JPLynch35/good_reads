class Review < ApplicationRecord
  validates_presence_of :content, :rating, :user_id, :book_id
  belongs_to :user
  belongs_to :book

end
