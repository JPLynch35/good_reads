require 'rails_helper'

describe 'a user' do
  describe 'visiting book index page' do
    before :each do
      @user1 = User.create(name: 'Bob')
      @user2 = User.create(name: 'Jill')
      @user3 = User.create(name: 'Joe')
      @book1 = Book.create(title: 'The Ham')
      @book2 = Book.create(title: 'The Turkey')
      @book3 = Book.create(title: 'The Liverwurst')
      @review1 = @book1.reviews.create(content: 'Great book!', rating: 4, user_id: @user1.id)
      @review2 = @book1.reviews.create(content: 'Okay book!', rating: 2, user_id: @user2.id)
      @review3 = @book2.reviews.create(content: 'Okay book!', rating: 1, user_id: @user2.id)
      @review4 = @book1.reviews.create(content: 'Okay book!', rating: 2, user_id: @user3.id)
      @review5 = @book1.reviews.create(content: 'Okay book!', rating: 2, user_id: @user3.id)
    end
    it'can see a list of all the books' do
      visit books_path

      expect(page).to have_content(@book1.title)
      expect(page).to have_content(@book2.title)
      expect(page).to have_content(@book3.title)
    end
    it'can click a book title and go to show page' do
      visit books_path
      click_on "The Ham"

      expect(current_path).to eq(book_path(@book1))
      expect(page).to have_content(@book1.title)
    end
  end
end
