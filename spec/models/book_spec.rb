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

    describe ".avg_rating" do
      it "can calculate the average rating for abook" do
        expect(@b1.avg_rating).to eq(4.75)
        expect(@b2.avg_rating).to eq(3.67)
        expect(@b5.avg_rating).to eq(1.5)
        expect(@b7.avg_rating).to eq("No reviews")
      end
    end

    describe ".sort_by_avg_rating_asc" do
      it "can sort the books by the average rating ascending" do
        # expect(Book.sort_by_avg_rating_asc).to eq([@b1,@b3])
        #can do .to include(adksfjasdkf) (if they have the same rating)
        expect(Book.sort_by_avg_rating(:asc).last.title).to eq("Title 1")
        expect(Book.sort_by_avg_rating(:asc)[1].title).to eq("Title 6")
        expect(Book.sort_by_avg_rating(:asc).first.title).to eq("Title 7")
      end
    end

    describe ".sort_by_avg_rating_desc" do
      xit "can sort the books by the average rating descending" do
        expect(Book.sort_by_avg_rating(:desc).first.title).to eq("Title 1")
        expect(Book.sort_by_avg_rating(:desc)[-2].title).to eq("Title 6")
        expect(Book.sort_by_avg_rating(:desc).last.title).to eq("Title 7")
      end
    end

    describe ".sort_by" do
      it "can sort the books by the pages ascending" do
        expect(Book.sort_by(:pages,:asc).last.title).to eq("Title 4")
        expect(Book.sort_by(:pages,:asc).first.title).to eq("Title 1")
      end
      it "can sort the books by their pages descending" do
        expect(Book.sort_by(:pages,:desc).first.title).to eq("Title 4")
        expect(Book.sort_by(:pages,:desc).last.title).to eq("Title 1")
      end
      it "can sort the books by their total reviews ascending" do
        expect(Book.sort_by(:reviews,:asc).last.title).to eq("Title 1")
      end
      it "can sort the books by their total reviews descending" do
        expect(Book.sort_by(:reviews,:desc).first.title).to eq("Title 1")
      end
    end
  end
end
