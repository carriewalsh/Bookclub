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
    @authors = Author.make_author_list(author_params)
    @book.authors << @authors

  end

  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to books_path
  end

private

  def book_params
    params.require(:book).permit(:title,:authors,:pages,:publication_year,:cover_image)
  end

  def author_params
    params.require(:authors) #idk if I can have a permit here...
  end

end
