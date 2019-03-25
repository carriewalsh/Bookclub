require "rails_helper"

RSpec.describe "Authors show page" do
  before :each do
    @a2 = Author.create(name:"John Foreman")
    @a5 = Author.create(name:"Edward Said")
    @a11 = Author.create(name:"Sebastian Gutierrez")
    @a26 = Author.create(name:"John Smith")
    @b2 = Book.create(title: "Data Smart", publication_year:2013, pages:235, cover_image: "https://images-na.ssl-images-amazon.com/images/I/41ex8HFBWnL._SX397_BO1,204,203,200_.jpg")
    @b2.authors << @a2
    @b2.authors << @a26
    @b5 = Book.create(title: "Orientalism", publication_year:1979, pages:197, cover_image: "https://upload.wikimedia.org/wikipedia/en/thumb/5/50/Orientalism%2C_first_edition.jpg/220px-Orientalism%2C_first_edition.jpg", authors: [@a5,@a26])
    @b11 = Book.create(title: "Data Scientists at Work", publication_year:2014, pages:230, cover_image: "https://images-na.ssl-images-amazon.com/images/I/417936m992L._SX348_BO1,204,203,200_.jpg", authors: [@a11,@a26])
    @r1 = @b2.reviews.create(username: "BookGirl1",title: "Great Book, Lousy References",rating: 4,review_text: "I would go as far as to say that the book is brilliant. First, a drop about me from the standpoint of this book. I have been an IT professional for many years specializing in programming, database, and MS Office add-ons. Part of my job entails self enrichment, that is, expand my working knowledge in areas potentially important for my job. I chose Foreman's book to help with this task for a number of reasons: a) Data Science is a hot area and my company does have a Data Science group, b) I have lots of data experience under my belt - I felt that it would be nice for once to get some useful information from the data, and c) I have a really good Excel background - so I figured that Foreman's approach would be perfect for me - little did I know that I would seriously add to my Excel bag of tricks.")
    @r20 = @b2.reviews.create(username: "Alexander",title: "Insightful, practical, and colorful. Perspective from a biased reviewer.",rating: 5,review_text: "Data Smart is none of these. Unlike Moneyball books, Data Smart contains enough practical information to actually start performing analyses. Unlike most textbooks, it doesn't get bogged down in mathematical notation. And unlike books about R or the distributed data blah-blah du jour, all the examples use good old Microsoft Excel. It's geared toward competent analysts who are comfortable with Excel and aren't afraid of thinking about problems in a mathematical way. It's goal isn't to revolutionize your business with million-dollar software, but rather to make incremental improvements to processes with accessible analytic techniques.")
  end

  context "as a visitor when I visit the books index page" do
    # it "when I click on an author name, it takes me to their page" do
    #   visit books_path
    #   click_link "John Smith"
    #   expect(current_path).to eq(author_path(@a26))
    #
    #   click_link "John Foreman"
    #   expect(current_path).to eq(author_path(@a2))
    # end
  end


  context "as a visitor, when I visit the Author page" do
    it "shows information for all the books they've written" do
      visit author_path(@a26)
      within first ".book-card" do
        expect(page).to have_content("Data Smart")
        expect(page).to have_content("Publication year: 2013")
        expect(page).to have_content("Pages: 235")
        expect(page).to have_link("John Foreman")
        filename = "https://images-na.ssl-images-amazon.com/images/I/41ex8HFBWnL._SX397_BO1,204,203,200_.jpg"
        expect(page).to have_css("img[src*='#{filename}']")
      end
    end

    it "shows one top review for each book" do
      visit author_path(@a26)
      within first ".book-card" do
        expect(page).to have_content(@r20.review_text)
        expect(page).to have_no_content(@r1.review_text)
      end
    end

    it "had a delete author button" do
      visit author_path(@a26)
      expect(page).to have_link("Delete Author")
      click_link("Delete Author")
      expect(current_path).to eq(books_path)
      expect(page).to have_no_link("John Smith")
    end


  end

end
