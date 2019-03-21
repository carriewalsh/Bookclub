require "rails_helper"

RSpec.describe "a user visiting books index page" do
  before :each do
    #@b1 = Book.create(title: "Book 1", publication_year: 1995, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
  end

  context "when I look at the stats bar" do
    it "should have 3 highest rated books" do
      visit books_path
      within ".highest-rated" do
        expect(page).to have_content("Highest rated books:")
        expect(page).to have_css(".book-snippet", count: 3)
      end
    end

    it "should have 3 lowest rated books" do
      visit books_path
      within ".lowest-rated" do
        expect(page).to have_content("Lowest rated books:")
        expect(page).to have_css("div.book-snippet", count: 3)
      end
    end

    it "should have 3 users who have reviewed the most books" do
      visit books_path
      within ".top-reviewers" do
        expect(page).to have_content("Top Reviewers")
        expect(page).to have_css("div.user-snippet", count: 3)
      end
    end
  end

  context "when I look at the sorting toggle" do
    xit "should have sort by most pages" do
      visit books_path
      within ".toggle" do
        expect(page).to have_button("Most Pages")
        click_button("Most Pages")
        expect(current_path).to eq books_path #is this right??
      end
    end

    xit "should have sort by fewest pages" do
      visit books_path
      within ".toggle" do
        expect(page).to have_button("Fewest Pages")
        click_button("Fewest Pages")
        expect(current_path).to eq books_path #is this right??
      end
    end

    xit "should have sort by most reviews" do
      visit books_path
      within ".toggle" do
        expect(page).to have_button("Most Reviews")
        click_button("Most Reviews")
        expect(current_path).to eq books_path #is this right??
      end
    end

    xit "should have sort by fewest reviews" do
      visit books_path
      within ".toggle" do
        expect(page).to have_button("Fewest Reviews")
        click_button("Fewest Reviews")
        expect(current_path).to eq books_path #is this right??
      end
    end

    xit "should have an add book button" do
      visit books_path
      within ".toggle" do
        expect(page).to have_button("Add Book")
        click_button("Add Book")
        expect(current_path).to eq new_book_path
      end
    end
  end

  context "when I look at the books section" do
    it "should show all book cards" do
      b1 = Book.create(title: "Book 1", publication_year: 1995, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
      visit books_path
      within ".books-container" do
        expect(page).to have_css(".book-card", count: 16) #CHANGE NUMBER
      end
    end

    it "should show the book title" do
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Book 1")
      end
    end

    it "should link to book page from title" do
      visit books_path
      within first ".book-card" do
        click_link "Book 1"
        expect(current_path).to eq book_path(book)
      end
    end

    it "should show the book publication year" do
      visit books_path
      within first ".book-card" do
        expect(page).to have_content(1995)
      end
    end

    it "should show the book pages count" do
      visit books_path
      within first ".book-card" do
        expect(page).to have_content(100)
      end
    end

    it "should show the book cover image" do
      visit books_path
      within first ".book-card" do
        filename = "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg"
        expect(page).to have_css("img[src*='#{filename}']")
      end
    end

    xit "should show the book average rating" do
      r1 = Review.create(title: "My Review", username: "BookGirl", rating:4, review_text: "BLalblahablahblah")
      r2 = Review.create(title: "My Review Again", username: "BookGirl2", rating: 3, review_text: "BLalblahablahblah")
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Average rating: 3.5") #fix number
      end
    end

    xit "should show the book number of reviews" do
      r1 = Review.create(title: "My Review", username: "BookGirl", rating:4, review_text: "BLalblahablahblah")
      r2 = Review.create(title: "My Review Again", username: "BookGirl2", rating: 3, review_text: "BLalblahablahblah")
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Total number of reviews: 2") #fix number
      end
    end

  end
end
