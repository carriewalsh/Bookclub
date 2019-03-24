require "rails_helper"

RSpec.describe Author, type: :model do

  describe 'Relationships' do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end

  describe "Instance Methods" do
    it "creates a list of authors from a string" do
      author_string_1 = "E.B. White, Carl Sandberg"
      author_string_2 = "J.K. Rowling"

      Author.make_author_list(author_string_1)
      actual_1 = Author.all

      expect(actual_1.count).to eq(2)
      expect(actual_1.first.class).to eq(Author)
      expect(actual_1.first.name).to eq("E.B. White")
      expect(actual_1.last.name).to eq("Carl Sandberg")

      Author.make_author_list(author_string_2)
      actual_2 = Author.all

      expect(actual_2.count).to eq(3)
      expect(actual_2.last.class).to eq(Author)
      expect(actual_2.last.name).to eq("J.K. Rowling")

      Author.make_author_list(author_string_2)
      actual_3 = Author.all

      expect(actual_3.count).to eq(3)
      expect(actual_3.last.class).to eq(Author)
      expect(actual_3.last.name).to eq("J.K. Rowling")
    end
  end

  describe "Class Methods" do
  end

end
