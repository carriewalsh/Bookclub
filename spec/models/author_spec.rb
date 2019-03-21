require "rails_helper"

RSpec.describe Author, type: :model do

  describe 'Relationships' do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end

  describe "Class Methods" do
    it "creates a list of authors from a string" do
      author_string_1 = "E.B. White, Carl Sanders"
      author_string_2 = "E.B. White"

      actual_list_1 = author_string_1.make_author_list
      expected_list_1 = ["E.B. White", "Carl Sanders"]

      actual_list_2 = author_string_2.make_author_list
      expected_list_2 = ["E.B. White"]

      expect(actual_list_1).to eq(expected_list_1)
      expect(actual_list_2).to eq(expected_list_2)

    end

  end

end
