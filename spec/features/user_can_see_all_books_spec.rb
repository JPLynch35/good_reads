require 'rails_helper'

describe 'a user' do
  describe 'visiting index page' do
    before :each do
      @book1 = Book.new(title: 'The Ham')
      @book2 = Book.new(title: 'The Turkey')
      @book3 = Book.new(title: 'The Liverwurst')
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
      expect(page).to have_content(book1.title)
    end
  end
end
