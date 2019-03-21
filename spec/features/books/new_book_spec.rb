require "rails_helper"

RSpec.describe "new book workflow" do
  context "as a visitor" do
    it "should create a new book successfully" do
      book_name = "Stewart Little"
      book_pages = "128"
      book_year = "1945"
      book_image = "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg"

      visit books_path
      click_button "Add Book"
      fill_in "Title:", with: book_name
      fill_in "Number of pages:", with: book_pages
      fill_in "Publication year:", with: book_year
      click_button "Create Book"
      expect(current_path).to eq book_path(book)

    end
  end

end
