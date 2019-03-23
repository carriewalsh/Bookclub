require "rails_helper"

RSpec.describe "a user visiting books index page" do
  before :each do
    @a = Author.create(name: "Sam Sampson")
    @b2 = @a.books.create(title: "Title 2", publication_year: 1996, pages: 200, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
    @b1 = @a.books.create(title: "Title 1", publication_year: 1996, pages: 1, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
    @b3 = @a.books.create(title: "Title 3", publication_year: 1996, pages: 300, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
    @b4 = @a.books.create(title: "Title 4", publication_year: 1996, pages: 400, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
    @b5 = @a.books.create(title: "Title 5", publication_year: 1996, pages: 350, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
    @b6 = @a.books.create(title: "Title 6", publication_year: 1996, pages: 250, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
    @b7 = @a.books.create(title: "Title 7", publication_year: 1996, pages: 250, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")


    @r0 = @b1.reviews.create(title: "Review 0", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
    @r1 = @b1.reviews.create(title: "Review 1", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
    @r2 = @b1.reviews.create(title: "Review 2", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
    @r3 = @b1.reviews.create(title: "Review 3", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
    @r4 = @b2.reviews.create(title: "Review 4", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
    @r5 = @b2.reviews.create(title: "Review 5", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
    @r6 = @b2.reviews.create(title: "Review 6", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
    @r7 = @b3.reviews.create(title: "Review 7", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
    @r8 = @b3.reviews.create(title: "Review 8", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
    @r9 = @b3.reviews.create(title: "Review 9", username: "BookGirl" , rating:2, review_text: "asdfjhlkjhglriuae")
    @r10 = @b4.reviews.create(title: "Review 10", username: "BookGirl" , rating:2, review_text: "asdfjhlkjhglriuae")
    @r11 = @b5.reviews.create(title: "Review 11", username: "BookGirl" , rating:2, review_text: "asdfjhlkjhglriuae")
    @r12 = @b5.reviews.create(title: "Review 11", username: "BookGirl" , rating:1, review_text: "asdfjhlkjhglriuae")
    @r13 = @b6.reviews.create(title: "Review 12", username: "BookGirl" , rating:1, review_text: "asdfjhlkjhglriuae")
  end

  context "when I look at the stats bar" do
    it "should have 3 highest rated books" do
      visit books_path
      within ".highest-rated" do
        expect(page).to have_content("Highest-rated Books")
        expect(page).to have_css(".book-snippet", count: 3)
      end
    end

    it "should have 3 lowest rated books" do
      visit books_path
      within ".lowest-rated" do
        expect(page).to have_content("Lowest-rated Books")
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
      visit books_path
      within ".books-container" do
        expect(page).to have_css(".book-card", count: 7) #CHANGE NUMBER
      end
    end

    it "should show the book title" do
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Title 2")
      end
    end

    xit "should link to book page from title" do
      visit books_path
      within first ".book-card" do
        click_link "Title 2"
        expect(current_path).to eq book_path(book)
      end
    end

    it "should show the book publication year" do
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Publication year: 1996")
      end
    end

    it "should show the book pages count" do
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Pages: 200")
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

      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Average Rating: 3.67") #fix number
      end
    end

    it "should show the book number of reviews" do
      visit books_path
      within first ".book-card" do
        expect(page).to have_content("Total Reviews: 3") #fix number
      end
    end

  end
end
