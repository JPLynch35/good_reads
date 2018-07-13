require 'rails_helper'

describe 'a user' do
  describe 'visiting book show page' do
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
    it'can see the book title and a list of reviews' do
      visit book_path(@book1)

      expect(page).to have_content(@book1.title)
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@review1.content)
      expect(page).to have_content(@review1.rating)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@review2.content)
      expect(page).to have_content(@review2.rating)
    end
    it'can see the average rating for the book' do
      visit book_path(@book1)

      average = (@review1.rating + @review2.rating + @review4.rating + @review5.rating) / 4.0

      expect(page).to have_content("Average Rating: #{average.round(1)}")
    end
    it'can see the maximum rating for the book' do
      visit book_path(@book1)

      expect(page).to have_content("Maximum Rating: #{@review1.rating}")
    end
    it'can see the user and review from the maximum rating for the book' do
      visit book_path(@book1)

      expect(page).to have_content("Maximum Rating User: #{@book1.max_rating_user}")
      expect(page).to have_content("Maximum Rating Review: #{@book1.max_rating_content}")
    end
    it'can see the minimum rating for the book' do
      visit book_path(@book1)

      expect(page).to have_content("Minimum Rating: #{@review4.rating}")
    end
    it'can see the user and review from the minimum rating for the book' do
      visit book_path(@book1)

      expect(page).to have_content("Minimum Rating User: #{@book1.min_rating_user}")
      expect(page).to have_content("Minimum Rating Review: #{@book1.min_rating_content}")
    end
  end
end