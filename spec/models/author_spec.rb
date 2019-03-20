require "rails_helper"

RSpec.describe Author, type: :model do

  describe 'Relationships' do
    it { should have_many :book_authors }
    it { should have_many(:books).through(:book_authors) }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
  end

end
