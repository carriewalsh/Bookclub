require "rails_helper"

RSpec.describe Review, type: :model do

  describe "Relationships" do
    it {should belong_to :book}
  end

  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :username}
    it {should validate_presence_of :rating}
    it {should validate_presence_of :review_text}
  end
end
