require 'rails_helper'

describe Review, type: :model do
  it 'should be able to calculate the average rewview ratings of a book' do
    @user1 = User.create(name: 'Bob')
    @user2 = User.create(name: 'Jill')
    @book1 = Book.create(title: 'The Ham')
    @book2 = Book.create(title: 'The Turkey')
    @book3 = Book.create(title: 'The Liverwurst')
    @review1 = @book1.reviews.create(content: 'Great book!', rating: 4, user_id: @user1.id)
    @review2 = @book1.reviews.create(content: 'Okay book!', rating: 2, user_id: @user2.id)

    expect(@book1.average_review_rating).to eq(3)
  end
end
