require "rails_helper"

RSpec.describe "new book workflow" do
  context "as a visitor" do
    it "should create a new book successfully" do
      book_name = "Stewart Little"
      book_author = "E.B. White, Some Guy"
      book_pages = "128"
      book_year = "1945"
      book_image = "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg"

      visit books_path
      click_link "Add Book"

      expect(current_path).to eq new_book_path
      fill_in "Title", with: book_name
      fill_in :authors, with: book_author
      fill_in "Pages", with: book_pages
      fill_in "Publication year", with: book_year



      click_button "Create Book"
      new_book = Book.last

      expect(new_book.cover_image).to eq book_image
      expect(current_path).to eq book_path(new_book)
    end

    it "should not create a book with a duplicate title" do
      a = Author.create(name: "Sam Sampson")
      b2 = a.books.create(title: "Stewart Little", publication_year: 1996, pages: 200, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
      book_name = "Stewart Little"
      book_author = "E.B. White, Some Guy"
      book_pages = "128"
      book_year = "1945"

      visit new_book_path
      fill_in "Title", with: book_name
      fill_in :authors, with: book_author
      fill_in "Pages", with: book_pages
      fill_in "Publication year", with: book_year
      click_button "Create Book"

      click_link "Books"
      within ".books-container" do
        expect(page).to have_content("Stewart Little", count: 1)
      end

    end
  end

end
