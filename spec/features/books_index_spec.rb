require "rails_helper"

RSpec.describe "a user visiting books index page" do
  before :each do
  end

  context "when I look at the stats bar" do
    it "should have 3 highest rated books" do
      visit books_path
      within ".statistics" do
        expect(page).to have_content("Three highest reviewed books:")
        expect(page).to have_css(".book-snippet", count: 3)
      end
    end

    it "should have 3 lowest rated books" do
      visit books_path
      within ".statistics" do
        expect(page).to have_content("Three lowest reviewed books:")
        expect(page).to have_css(".book-snippet", count: 3)
      end
    end

    it "should have 3 users who have reviewed the most books" do
      visit books_path
      within ".statistics" do
        expect(page).to have_content("Top Reviewers")
        expect(page).to have_css(".user-snippet", count: 3)
      end
    end
  end
end
