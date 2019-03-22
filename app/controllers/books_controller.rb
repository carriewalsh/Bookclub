class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @authors = @book.authors
    @reviews = @book.reviews
    @worst_three_reviews = @reviews.order(:rating).take(3)
    @top_three_reviews = @reviews.order(rating: :desc).take(3)
    @average_review_rating = @reviews.average(:rating)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    @author = @book.authors.find_or_create_by(params[:authors])
  end

private

  def book_params
    params.require(:book).permit(:title,:authors,:pages,:publication_year)
  end

end
