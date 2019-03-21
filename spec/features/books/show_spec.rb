require 'rails_helper'

RSpec.describe 'book show page', type: :feature do
  describe 'shows book information' do
    it 'shows book information' do
      book = Book.create(title: 'Book 1', publication_year: 1989, pages: 200, cover_image: 'some image')
      author_1 = book.authors.create(name: "Ethan Grab")
      author_2 = book.authors.create(name: "Carrie Smith")
      author_3 = Author.create(name: "Joe Bob")


      visit book_path(book.id)

      expect(page).to have_content("Title: #{book.title}")
      expect(page).to have_content("Author(s):")
      expect(page).to have_content("Ethan Grab")
      expect(page).to have_content("Carrie Smith")
      expect(page).to have_content("Publication Year: #{book.publication_year}")
      expect(page).to have_content("Page Count: #{book.pages}")
      #need to add image test (xpath?)
      #once html is done add within tests

    end
  end

  describe 'shows review infomation' do
    it 'shows review information' do
      book = Book.create(title: 'Book 1', publication_year: 1989, pages: 200, cover_image: 'some image')
      review_1 = book.reviews.create(username: 'User 1', title: 'Review 1', rating: 4, review_text: "This book is great")
      review_2 = book.reviews.create(username: 'User 2', title: 'Review 2', rating: 1, review_text: "This book is terrible")

      visit book_path(book.id)

      expect(page).to have_content("Review Title: #{review_1.title}")
      expect(page).to have_content("Username: #{review_1.username}")
      expect(page).to have_content("Rating: #{review_1.rating}")
      expect(page).to have_content("Review: #{review_1.review_text}")

      expect(page).to have_content("Review Title: #{review_2.title}")
      expect(page).to have_content("Username: #{review_2.username}")
      expect(page).to have_content("Rating: #{review_2.rating}")
      expect(page).to have_content("Review: #{review_2.review_text}")
      #once html is done add within tests
    end
  end

end
