require "rails_helper"

RSpec.describe Review, type: :model do
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
    @r2 = @b11.reviews.create(username: "BookGirl1", title: "S'okay",rating: 4,review_text: "I forgot to read it")
    @r20 = @b2.reviews.create(username: "Alexander",title: "Insightful, practical, and colorful. Perspective from a biased reviewer.",rating: 5,review_text: "Data Smart is none of these. Unlike Moneyball books, Data Smart contains enough practical information to actually start performing analyses. Unlike most textbooks, it doesn't get bogged down in mathematical notation. And unlike books about R or the distributed data blah-blah du jour, all the examples use good old Microsoft Excel. It's geared toward competent analysts who are comfortable with Excel and aren't afraid of thinking about problems in a mathematical way. It's goal isn't to revolutionize your business with million-dollar software, but rather to make incremental improvements to processes with accessible analytic techniques.")
  end

  describe "Relationships" do
    it {should belong_to :book}
  end

  describe "Validations" do
    it {should validate_presence_of :username}
    it {should validate_presence_of :title}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :review_text}
  end

  describe 'Model Testing' do
    xit '.sort_reviews_by_created_at(:desc)' do
      expect(Review.sort_reviews_by_created_at(:desc).last.title).to eq("Review 1")
      expect(Review.sort_reviews_by_created_at(:desc)[1].title).to eq("Review 2")
      expect(Review.sort_reviews_by_created_at(:desc).first.title).to eq("Review 3")
    end

    xit 'sort_reviews_by_created_at(:asc)' do
      expect(Review.sort_reviews_by_created_at(:asc).last.title).to eq("Review 3")
      expect(Review.sort_reviews_by_created_at(:asc)[1].title).to eq("Review 2")
      expect(Review.sort_reviews_by_created_at(:asc).first.title).to eq("Review 1")
    end

    it "makes a list of top three reviewers" do
      expect(Review.take_top_three_reviewers.first.username).to eq("BookGirl1") #or whatever
    end
  end
end
