class Author < ApplicationRecord
  has_many :book_authors, :dependent => :destroy
  has_many :books, through: :book_authors

  validates_presence_of :name

  def self.make_author_list(string)
    array = string.split(",")
    array.map do |author|
      Author.find_or_create_by(name: author.titleize.strip)
    end
  end

end
