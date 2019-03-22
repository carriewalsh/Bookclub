require "rails_helper"

RSpec.describe Book, type: :model do

  describe 'Relationships' do
    it { should have_many :reviews }
    it { should have_many :book_authors }
    it { should have_many(:authors).through(:book_authors) }
  end

  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :publication_year }
    it { should validate_presence_of :pages }
    it { should validate_presence_of :cover_image }
  end

  describe "Class Methods" do
    before :each do
      @a = Author.create(name: "Sam Sampson")
      @b1 = @a.books.create(title: "Title 1", publication_year: 1996, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
      @b2 = @a.books.create(title: "Title 2", publication_year: 1996, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
      @b3 = @a.books.create(title: "Title 3", publication_year: 1996, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
      @b4 = @a.books.create(title: "Title 4", publication_year: 1996, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
      @b5 = @a.books.create(title: "Title 5", publication_year: 1996, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")
      @b6 = @a.books.create(title: "Title 6", publication_year: 1996, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")

      @r1 = @b1.reviews.create(title: "Review ", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
      @r2 = @b1.reviews.create(title: "Review ", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
      @r3 = @b1.reviews.create(title: "Review ", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
      @r4 = @b2.reviews.create(title: "Review ", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
      @r5 = @b2.reviews.create(title: "Review ", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
      @r6 = @b2.reviews.create(title: "Review ", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
      @r7 = @b3.reviews.create(title: "Review ", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
      @r8 = @b3.reviews.create(title: "Review ", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
      @r9 = @b3.reviews.create(title: "Review ", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
      @r10 = @b4.reviews.create(title: "Review ", username: "BookGirl" , rating:2, review_text: "asdfjhlkjhglriuae")
      @r11 = @b5.reviews.create(title: "Review ", username: "BookGirl" , rating:2, review_text: "asdfjhlkjhglriuae")
      @r12 = @b6.reviews.create(title: "Review ", username: "BookGirl" , rating:1, review_text: "asdfjhlkjhglriuae")
    end

    describe ".avg_rating" do
      expect(Book.avg_rating).to eq()
    end

    describe ".sort_by_pages_asc" do
      expect(Book.sort_by_pages_asc).to eq()
    end

    describe ".sort_by_pages_desc" do
      expect(Book.sort_by_pages_desc).to eq()
    end

    describe ".sort_by_rating_asc" do
      expect(Book.sort_by_total_reviews_asc).to eq()
    end

    describe ".sort_by_rating_desc" do
      expect(Book.sort_by_total_reviews_desc).to eq()
    end

  end
end
