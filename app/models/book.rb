class Book < ApplicationRecord

  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews

  validates_presence_of :title, :publication_year, :pages, :cover_image



end
