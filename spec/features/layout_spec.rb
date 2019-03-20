require "rails_helper"

RSpec.describe "a user visiting any page" do
  before :each do
  end


  context "when I look at the navigation bar" do
    it "should have the links" do
      visit root_path
      within "nav" do
        expect(page).to have_link("Home")
        expect(page).to have_link("Books")
      end
    end

    it "should link home to root" do
      visit books_path
      within "nav" do
        click_link "Home"
        expect(current_path).to eq root_path
      end
    end

    it "should link books to book index page" do
      visit root_path
      within "nav" do
        click_link "Books"
        expect(current_path).to eq books_path
      end
    end
  end
end
