class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @authors = @book.authors
    @reviews = @book.reviews
    @top_three_reviews = @reviews.order(:rating).take(3)
    @worst_three_reviews = @reviews.order(rating: :desc).take(3)
    @average_review_rating = @reviews.average(:rating)
  end

end
