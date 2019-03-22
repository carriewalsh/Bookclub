require 'rails_helper'

RSpec.describe "As a visiter" do
  describe "I visit a books show page" do
    it "I can add a new song" do
      @book = Book.create(title: 'A very specific book title', publication_year: 1989, pages: 200, cover_image: 'some image')

      visit book_path(@book.id)

      click_link 'Add Review'

      expect(current_path).to eq(new_book_review_path(@book.id))

      fill_in 'Title', with: 'Review Form'
      fill_in 'username', with: "Ethan Grab"
      fill_in 'song[play_count]', with: 3

      click_button 'Create Review'

      new_review = Review.last

      expect(current_path).to eq(book_path(@book.id))
      expect(new_review.book).to eq(@book)
      expect(new_review.title).to eq('Review Form')
    end
  end
end
