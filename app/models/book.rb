class Book < ApplicationRecord

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  validates_presence_of :title, :publication_year, :pages, :cover_image

  def self.avg_rating(book_id)
    Review.where("reviews.book_id = #{book_id}").average(:rating)
  end

  def self.sort_by_total_reviews_asc
    Book.left_outer_joins(:reviews).group("books.id").order("count(reviews.id) ASC")
  end

end
