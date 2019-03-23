class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  validates_presence_of :name

  def make_author_list
    array = self.name.split(",")
    array.map do |author|
      Author.find_or_create_by(name: author.titleize.strip)
    end
  end

end
# Book.create(askjjasd;lfk, authors: [@author_1, @author_3])
