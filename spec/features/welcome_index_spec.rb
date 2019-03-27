require "rails_helper"

RSpec.describe "Welcome page", type: :feature do
  context "As a user on the index page" do
    it "should have a welcome message" do
      visit root_path
      expect(page).to have_content("Welcome to Book Club!")
    end

    it "should have a link to enter the site" do
      visit root_path
      expect(page).to have_link("Enter Site")

      click_link "Enter Site"
      expect(current_path).to eq(books_path)
    end

    it "should have links to the coauthors github pages" do
      visit root_path
      expect(page).to have_link("Ethan Grab's Github")
      expect(page).to have_link("Carrie Walsh's Github")
    end
  end
end
