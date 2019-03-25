class BooksController < ApplicationController
  def index
    @top_3 = Book.sort_by_avg_rating(:desc).take(3)
    @bottom_3 = Book.sort_by_avg_rating(:asc).take(3)
    #@top_reviewers =
    if params.has_key?("sort")
      if params[:sort] == "Best Average Rating"
        @books = Book.sort_by_avg_rating(:desc)
      elsif params[:sort] == "Worst Average Rating"
        @books = Book.sort_by_avg_rating(:asc)
      elsif params[:sort] == "Most Pages"
        @books = Book.sort_by(:pages,:desc)
      elsif params[:sort] == "Fewest Pages"
        @books = Book.sort_by(:pages,:asc)
      elsif params[:sort] == "Most Reviews"
        @books = Book.sort_by(:reviews,:desc)
      elsif params[:sort] == "Fewest Reviews"
        @books = Book.sort_by(:reviews,:asc)
      end
    else
      @books = Book.all
    end
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

    if params[:book][:cover_image] == nil
      params[:book][:cover_image] = "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg"
    end
    params.require(:book).permit(:title,:authors,:pages,:publication_year,:cover_image)
  end

  def author_params
    params.require(:authors) #idk if I can have a permit here...
  end

end
