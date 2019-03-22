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


      @r0 = @b1.reviews.create(title: "Review 0", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
      @r1 = @b1.reviews.create(title: "Review 1", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
      @r2 = @b1.reviews.create(title: "Review 2", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
      @r3 = @b1.reviews.create(title: "Review 3", username: "BookGirl" , rating:5, review_text: "asdfjhlkjhglriuae")
      @r4 = @b2.reviews.create(title: "Review 4", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
      @r5 = @b2.reviews.create(title: "Review 5", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
      @r6 = @b2.reviews.create(title: "Review 6", username: "BookGirl" , rating:4, review_text: "asdfjhlkjhglriuae")
      @r7 = @b3.reviews.create(title: "Review 7", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
      @r8 = @b3.reviews.create(title: "Review 8", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
      @r9 = @b3.reviews.create(title: "Review 9", username: "BookGirl" , rating:3, review_text: "asdfjhlkjhglriuae")
      @r10 = @b4.reviews.create(title: "Review 10", username: "BookGirl" , rating:2, review_text: "asdfjhlkjhglriuae")
      @r11 = @b5.reviews.create(title: "Review 11", username: "BookGirl" , rating:2, review_text: "asdfjhlkjhglriuae")
      @r12 = @b6.reviews.create(title: "Review 12", username: "BookGirl" , rating:1, review_text: "asdfjhlkjhglriuae")
    end
    # @a = Author.create(name: "Sam Sampson")
    # @b1 = @a.books.create(title: "Title 1", publication_year: 1996, pages: 100, cover_image: "https://timedotcom.files.wordpress.com/2015/06/521811839-copy.jpg")

    describe ".avg_rating" do
      it "can calculate the average rating for abook" do
        expect(Book.avg_rating(@b1.id).round(2)).to eq(5)
        expect(Book.avg_rating(@b2.id).round(2)).to eq(4)
        expect(Book.avg_rating(@b6.id).round(2)).to eq(1)
      end
    end

    describe ".sort_by_avg_rating_asc" do
      it "can sort the books by the average rating ascending" do
        expect(Book.sort_by_avg_rating_asc.first.title).to eq("Title 1")
        expect(Book.sort_by_avg_rating_asc.last.title).to eq("Title 6")
      end
    end

    describe ".sort_by_avg_rating_desc" do
      it "can sort the books by the average rating descending" do
        expect(Book.sort_by_avg_rating_desc).to eq()
      end
    end

    describe ".sort_by_pages_asc" do
      it "can sort the books by the pages ascending" do
        expect(Book.sort_by_pages_asc).to eq()
      end
    end

    describe ".sort_by_pages_desc" do
      it "can sort the books by their pages descending" do
        expect(Book.sort_by_pages_desc).to eq()
      end
    end

    describe ".sort_by_total_reviews_asc" do
      it "can sort the books by their total reviews ascending" do
        expect(Book.sort_by_total_reviews_asc.last.title).to eq("Title 1")
      end
    end

    describe ".sort_by_total_reviews_desc" do
      it "can sort the books by their total reviews descending" do
        expect(Book.sort_by_total_reviews_desc.first.title).to eq("Title 1")

      end
    end

  end
end
