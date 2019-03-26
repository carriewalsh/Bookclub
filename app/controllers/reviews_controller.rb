class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    @review.username = @review.username.titleize
    if @book.reviews.where(username: review_params[:username])
      redirect_to book_path(@book)
    else
      @review.save
      redirect_to book_path(@book)
    end
  end

  def show
<<<<<<< HEAD
    @reviews = Review.where(username: params[:id])
    @fooling_around = Review.fooling_around
=======
    @username = params[:id]
    if params.has_key?("sort")
      if params[:sort] == "Oldest Reviews"
        @reviews = Review.where(username: params[:id]).sort_reviews_by_created_at(:asc)
      else
        @reviews = Review.where(username: params[:id]).sort_reviews_by_created_at(:desc)
      end
    else
      @reviews = Review.where(username: params[:id])
    end
>>>>>>> 856487ba863307583d618cf02a76a5c2ebecb70b
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
