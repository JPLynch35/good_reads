class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.includes(:reviews).includes(:users).find(params[:id])
  end
end
