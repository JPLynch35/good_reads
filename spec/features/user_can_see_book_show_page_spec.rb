require 'rails_helper'

describe 'a user' do
  describe 'visiting book show page' do
    before :each do
      @user1 = User.create(name: 'Bob')
      @user2 = User.create(name: 'Jill')
      @book1 = Book.create(title: 'The Ham')
      @book2 = Book.create(title: 'The Turkey')
      @book3 = Book.create(title: 'The Liverwurst')
      @review1 = @book1.reviews.create(content: 'Great book!', user_id: @user1.id)
      @review2 = @book1.reviews.create(content: 'Great book!', user_id: @user2.id)
    end
    it'can see the book title and a list of reviews' do
      visit book_path(@book1)

      expect(page).to have_content(@book1.title)
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@review1.content)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@review2.content)
    end
  end
end