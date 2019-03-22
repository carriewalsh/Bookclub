class Book < ApplicationRecord

  has_many :book_authors
  has_many :authors, through: :book_authors, :dependent => :destroy
  has_many :reviews, :dependent => :destroy

  validates_presence_of :title, :publication_year, :pages, :cover_image



end
