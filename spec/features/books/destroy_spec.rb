require 'rails_helper'

RSpec.describe 'book show page', type: :feature do
  before :each do
    @book = Book.create(title: 'A very specific book title', publication_year: 1989, pages: 200, cover_image: 'some image')
    @author_1 = @book.authors.create(name: "Ethan Grab")
    @author_2 = @book.authors.create(name: "Carrie Smith")
    @review_1 = @book.reviews.create(username: 'User 1', title: 'Review 1', rating: 4, review_text: "This book is great")
    @review_2 = @book.reviews.create(username: 'User 2', title: 'Review 2', rating: 1, review_text: "This book is terrible")
    @review_3 = @book.reviews.create(username: 'User 3', title: 'Review 3', rating: 2, review_text: "This book is a travesty")
    @review_4 = @book.reviews.create(username: 'User 4', title: 'Review 4', rating: 5, review_text: "This book is amazing")
  end



  describe 'deletes book information' do
    it 'can delete book record' do

      visit book_path(@book)

      click_link 'Delete'

      expect(current_path).to eq(books_path)
      expect(page).to have_no_content(@book.title)
    end
  end



end
