class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    @review.save
    redirect_to book_path(@book)
  end

  def show
    @reviews = Review.where(username: params[:id])
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    redirect_to review_path(@review.username)
  end

  private

  def review_params
    params.require(:review).permit(:title, :username, :rating, :review_text)
  end
end
