class Book < ApplicationRecord

  has_many :book_authors, :dependent => :destroy
  has_many :authors, through: :book_authors
  has_many :reviews, :dependent => :destroy

  validates_presence_of :title, :publication_year, :pages, :cover_image

  # def self.avg_rating(book_id)
  #   Review.where("reviews.book_id = #{book_id}").average(:rating)
  # end

  def avg_rating
    if reviews.count == 0
      p "none"
    else
      reviews.average(:rating).round(2)
    end
  end


# make this one method with lots of arguments(how many, asc/desc/ other?) limit(Book.all.count)
  def self.sort_by_avg_rating_asc
    book_array = []
    no_reviews = Book.all.find_all {|book| book.reviews == []}
    book_array << no_reviews
    book_array.flatten!

    low_high = Review.group(:book_id).order("average_rating").average(:rating) #FINALLY
    low_high.each do |bk_id,avg_rating|
      book_array << Book.find(bk_id)
    end
    book_array
  end

  def self.sort_by_avg_rating_desc
    book_array = []
    no_reviews = Book.all.find_all {|book| book.reviews == []}
    book_array << no_reviews
    book_array.flatten!

    low_high = Review.group(:book_id).order("average_rating").average(:rating) #FINALLY
    low_high.each do |bk_id,avg_rating|
      book_array << Book.find(bk_id)
    end
    book_array
  end


# Book.includes(:reviews).order("reviews.rating").group("books.id","reviews.rating").average("reviews.rating").keys #array of book_id and ratings (inlude nil)
# Review.group(:book_id).average(:rating) #array of book_id and avg rating (no nil)
#
#
#     Book.includes(:reviews).order("reviews.rating").group(:books,"reviews.rating").average("reviews.rating").keys
#     Book.select("reviews.*","books.*").includes(:reviews).order("reviews.rating").
#     # Get the books and their reviews. Average the ratings for each book. Order the books by that average rating. Return the books.
#     Book.select("books.id, average(reviews.rating)").joins(:reviews).group("books.id").order("average(reviews.rating")
#     Book.select("books.id, average(reviews.rating)").includes(:reviews).group("books.id").order("average(reviews.rating")
#     #ish!
#     #this gives me a hash of the books and their average rating

  def self.sort_by_pages_asc
    Book.order(pages: :asc)
  end

  def self.sort_by(topic, direction)
    if topic == :pages
      Book.order(:pages => direction)
    elsif topic == :reviews
      Book.left_outer_joins(:reviews).group("books.id").order("count(reviews.id) #{direction}")
    end
  end
end
