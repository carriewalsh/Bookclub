require "rails_helper"

RSpec.describe "a user visiting books index page" do
  before :each do
    #@b1 = Book.create(title: "Book 1", publication_year: 1995, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
  end

  context "when I look at the stats bar" do
    it "should have 3 highest rated books" do
      visit books_path
      within ".highest-rated" do
        expect(page).to have_content("Three highest rated books:")
        expect(page).to have_css(".book-snippet", count: 3)
      end
    end

    it "should have 3 lowest rated books" do
      visit books_path
      within ".lowest-rated" do
        expect(page).to have_content("Three lowest rated books:")
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
        expect(page).to have_css(".book-card", count: 14) #CHANGE NUMBER
      end
    end

    it "should show the book title" do
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Book 1")
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

    xit "should show the book cover image" do
      #IDK HOW TO TEST FOR IMG
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
      end
    end
  end
end
