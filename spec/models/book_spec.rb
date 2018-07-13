require 'rails_helper'

describe Review, type: :model do
  before :each do
    @user1 = User.create(name: 'Bob')
    @user2 = User.create(name: 'Jill')
    @book1 = Book.create(title: 'The Ham')
    @book2 = Book.create(title: 'The Turkey')
    @book3 = Book.create(title: 'The Liverwurst')
    @review1 = @book1.reviews.create(content: 'Great book!', rating: 4, user_id: @user1.id)
    @review2 = @book1.reviews.create(content: 'Okay book!', rating: 2, user_id: @user2.id)
    @review3 = @book2.reviews.create(content: 'Okay book!', rating: 1, user_id: @user2.id)
  end
  it 'should be able to calculate the average rewview ratings of a book' do
    expect(@book1.average_review_rating).to eq(3)
  end
  it 'should be able to find the maximum for each book' do
    expect(@book1.max_rating).to eq(4)
  end
end
