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
      p "No reviews"
    else
      reviews.average(:rating).round(2)
    end
  end


#   def self.sort_by_avg_rating_asc
#     book_array = []
#     no_reviews = Book.all.find_all {|book| book.reviews == []}
#     book_array << no_reviews
#     book_array.flatten!
#
#     low_high = Review.group(:book_id).order("average_rating").average(:rating) #FINALLY
#     low_high.each do |bk_id,avg_rating|
#       book_array << Book.find(bk_id)
#     end
#     book_array
#   end

  # def self.sort_by_avg_rating_desc
  #   book_array = []
  #   no_reviews = Book.all.find_all {|book| book.reviews == []}
  #   book_array << no_reviews
  #   book_array.flatten!
  #
  #   low_high = Review.group(:book_id).order("average_rating").average(:rating) #FINALLY
  #   low_high.each do |bk_id,avg_rating|
  #     book_array << Book.find(bk_id)
  #   end
  #   book_array
  # end



  def self.sort_by_avg_rating(direction, null)
    if null = :without
      arr = joins(:reviews).group('books.id').order('avg(reviews.rating) DESC')
    elsif null = :with
      binding.pry
      arr = left_outer_joins(:reviews).group('books.id').order('avg(reviews.rating) DESC NULLS LAST')
    end
    if direction == :desc
      arr
    elsif direction == :asc
      arr.reverse
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
