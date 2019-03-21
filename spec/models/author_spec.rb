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
      author_string_1 = Author.create(name:"E.B. White, Carl Sandberg")
      author_string_2 = Author.create(name: "E.B. White")

      actual_list_1 = author_string_1.make_author_list
      expected_list_1 = ["E.B. White", "Carl Sandberg"]

      actual_list_2 = author_string_2.make_author_list
      expected_list_2 = ["E.B. White"]

      expect(actual_list_1.count).to eq(2)
      expect(actual_list_1.first.class).to eq(Author)
      expect(actual_list_1.first.name).to eq("E.B. White")
      expect(actual_list_1.last.name).to eq("Carl Sandberg")
      expect(actual_list_2.count).to eq(1)
      expect(actual_list_2.first.class).to eq(Author)

    end

  end

end
