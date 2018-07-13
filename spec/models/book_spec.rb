require 'rails_helper'

describe Review, type: :model do
  before :each do
    @user1 = User.create(name: 'Bob')
    @user2 = User.create(name: 'Jill')
    @user3 = User.create(name: 'Joe')
    @book1 = Book.create(title: 'The Ham')
    @book2 = Book.create(title: 'The Turkey')
    @book3 = Book.create(title: 'The Liverwurst')
    @review1 = @book1.reviews.create(content: 'Great book!', rating: 4, user_id: @user1.id)
    @review2 = @book1.reviews.create(content: 'Okay book!', rating: 3, user_id: @user2.id)
    @review3 = @book2.reviews.create(content: 'Okay book!', rating: 1, user_id: @user2.id)
    @review4 = @book1.reviews.create(content: 'Okay book!', rating: 2, user_id: @user3.id)
    @review5 = @book1.reviews.create(content: 'Okay book!', rating: 3, user_id: @user3.id)
    
  end
  it 'should be able to calculate the average rewview ratings of a book' do
    expect(@book1.average_review_rating).to eq(3)
  end
  it 'should be able to find the maximum rating for each book' do
    expect(@book1.max_rating).to eq(4)
  end
  it 'should be able to find user of the max rating of a book' do
    expect(@book1.max_rating_user).to eq(@review1.user.name)
  end
  it 'should be able to find content of the max rating of a book' do
    expect(@book1.max_rating_content).to eq(@review1.content)
  end
  it 'should be able to find the minimum rating for each book' do
    expect(@book1.min_rating).to eq(2)
  end
  it 'should be able to find user of the min rating of a book' do
    expect(@book1.min_rating_user).to eq(@review4.user.name)
  end
  it 'should be able to find content of the min rating of a book' do
    expect(@book1.min_rating_content).to eq(@review4.content)
  end
end
