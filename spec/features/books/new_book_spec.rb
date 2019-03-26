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
      # expect(params[:book][:cover_image]).to eq book_image how do I check this sad path?
      expect(current_path).to eq book_path(new_book)


    end
  end

end
