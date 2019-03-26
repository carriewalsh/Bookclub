class Book < ApplicationRecord

  has_many :book_authors, :dependent => :destroy
  has_many :authors, through: :book_authors, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  validates_presence_of :title, :publication_year, :pages, :cover_image
  validates :title, uniqueness: true

  # def self.avg_rating(book_id)
  #   Review.where("reviews.book_id = #{book_id}").average(:rating)
  # end

  def avg_rating
    if reviews.count == 0
      p "No reviews"
    else
      reviews.average(:rating).round(2)
    end
  end

  def top_review
    reviews.order(rating: :desc).take
  end

  def other_authors(author)
    authors.where.not("authors.name": author.name)
  end

  def worst_three_reviews(reviews)
    reviews.order(:rating).take(3)
  end

  def top_three_reviews(reviews)
    reviews.order(rating: :desc).take(3)
  end

  def average_rating(reviews)
    reviews.average(:rating)
  end

  def self.sort_by_avg_rating(direction)
    if direction == :desc
      left_outer_joins(:reviews).group('books.id').order('avg(reviews.rating) DESC NULLS LAST')
    elsif direction == :asc
      left_outer_joins(:reviews).group('books.id').order('avg(reviews.rating) ASC NULLS LAST')
    end
  end

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
