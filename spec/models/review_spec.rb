require "rails_helper"

RSpec.describe Review, type: :model do

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
    it '.sort_reviews_by_created_at(:desc)' do
      expect(Review.sort_reviews_by_created_at(:desc).last.title).to eq("Review 1")
      expect(Review.sort_reviews_by_created_at(:desc)[1].title).to eq("Review 2")
      expect(Review.sort_reviews_by_created_at(:desc).first.title).to eq("Review 3")
    end

    it 'sort_reviews_by_created_at(:asc)' do
      expect(Review.sort_reviews_by_created_at(:asc).last.title).to eq("Review 3")
      expect(Review.sort_reviews_by_created_at(:asc)[1].title).to eq("Review 2")
      expect(Review.sort_reviews_by_created_at(:asc).first.title).to eq("Review 1")
    end
  end
end
