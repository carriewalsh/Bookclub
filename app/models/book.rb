class Book < ApplicationRecord

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  validates_presence_of :title, :publication_year, :pages, :cover_image

  def self.avg_rating(book_id)
    Review.where("reviews.book_id = #{book_id}").average(:rating)
  end

  def self.sort_by_avg_rating_asc
     Book.includes(:reviews).group("books.id").average("reviews.rating") #ish!
     #this gives me a hash of the books and their average rating
  end

  def self.sort_by_pages_asc
    Book.order(pages: :asc)
  end

  def self.sort_by_pages_desc
    Book.order(pages: :desc)
  end

  def self.sort_by_total_reviews_asc
    Book.left_outer_joins(:reviews).group("books.id").order("count(reviews.id) ASC")
  end

  def self.sort_by_total_reviews_desc
    Book.left_outer_joins(:reviews).group("books.id").order("count(reviews.id) DESC")
  end

end
