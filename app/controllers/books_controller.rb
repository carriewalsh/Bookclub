class BooksController < ApplicationController
  def index
    @top_3 = Book.sort_by_avg_rating(:desc).take(3)
    @bottom_3 = Book.sort_by_avg_rating(:asc).take(3)
    @reviewers = Review.take_top_three_reviewers
    @error = "ERROR"

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
    if params[:error]
      @error = params[:error]
    end
    @book = Book.find(params[:id])
    @authors = @book.authors
    @reviews = @book.reviews
    @worst_three_reviews = @book.worst_three_reviews(@reviews)
    @top_three_reviews = @book.top_three_reviews(@reviews)
    @average_review_rating = @book.average_rating(@reviews)
  end


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.title = @book.title.titleize
    @book.save
    if @book.id == nil
      redirect_to book_path(Book.find_by(title: @book.title),error: "That title already exists. Perhaps you meant this book.")
    else
      @authors = Author.make_author_list(author_params)
      @book.authors << @authors
      redirect_to book_path(Book.find_by(title: @book.title))
    end
  end

  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to books_path
  end

private

  def book_params

    if params[:book][:cover_image] == ""
      params[:book][:cover_image] = "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg"
    end
    params.require(:book).permit(:title,:authors,:pages,:publication_year,:cover_image)
  end

  def author_params
    params.require(:authors) #idk if I can have a permit here...
  end

end
