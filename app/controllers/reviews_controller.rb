class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    @review.username = @review.username.titleize
    if @book.reviews.exists?(username: review_params[:username])
      redirect_to book_path(@book, error: "This user has already reviewed this book")
    else
      @review.save
      redirect_to book_path(@book)
    end
  end

  def show
    @username = params[:id]
    if params[:error]
      @error = params[:error]
    end
    if params.has_key?("sort")
      if params[:sort] == "Oldest Reviews"
        @reviews = Review.where(username: params[:id]).sort_reviews_by_created_at(:asc)
      else
        @reviews = Review.where(username: params[:id]).sort_reviews_by_created_at(:desc)
      end
    else
      @reviews = Review.where(username: params[:id])
    end
  end

  def destroy
    @review = Review.find(params[:id]).destroy
    if Review.find_by(username: @review.username)
      redirect_to review_path(@review.username)
    else
      redirect_to books_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :username, :rating, :review_text)
  end
end
