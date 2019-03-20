require "rails_helper"

RSpec.describe "a user visiting books index page" do
  before :each do
  end

  context "when I look at the stats bar" do
    it "should have 3 highest rated books" do
      visit books_path
      within ".highest-rated" do
        expect(page).to have_content("Three highest rated books:")
        expect(page).to have_css(".book-snippet", count: 3)
      end
    end

    it "should have 3 lowest rated books" do
      visit books_path
      within ".lowest-rated" do
        expect(page).to have_content("Three lowest rated books:")
        expect(page).to have_css("div.book-snippet", count: 3)
      end
    end

    it "should have 3 users who have reviewed the most books" do
      visit books_path
      within ".top-reviewers" do
        expect(page).to have_content("Top Reviewers")
        expect(page).to have_css("div.user-snippet", count: 3)
      end
    end
  end
end
