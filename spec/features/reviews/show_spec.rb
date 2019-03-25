require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  before :each do
    @book_1 = Book.create(title: 'Book 1', publication_year: 1989, pages: 200, cover_image: 'some image')
    @book_2 = Book.create(title: 'Book 2', publication_year: 1989, pages: 200, cover_image: 'some image')
    @book_3 = Book.create(title: 'Book 3', publication_year: 1989, pages: 200, cover_image: 'some image')
    @author_1 = @book_1.authors.create(name: "Author 1")
    @author_2 = @book_2.authors.create(name: "Author 2")
    @author_3 = @book_3.authors.create(name: "Author 3")
    @review_1 = @book_1.reviews.create(username: 'User 1', title: 'Review 1', rating: 4, review_text: "This book is great")
    @review_2 = @book_2.reviews.create(username: 'User 1', title: 'Review 2', rating: 1, review_text: "This book is terrible")
    @review_3 = @book_3.reviews.create(username: 'User 1', title: 'Review 3', rating: 2, review_text: "This book is a travesty")
    @review_4 = @book_3.reviews.create(username: 'User 4', title: 'Review 4', rating: 5, review_text: "This book is amazing")
  end
  it 'shows user information' do

    visit review_path(@review_1.username)

    expect(page).to have_content("Review Title: #{@review_1.title}")
    expect(page).to have_content("Review Title: #{@review_2.title}")
    expect(page).to have_content("Review Title: #{@review_3.title}")

    expect(page).to have_content("Review: #{@review_1.review_text}")
    expect(page).to have_content("Review: #{@review_2.review_text}")
    expect(page).to have_content("Review: #{@review_3.review_text}")

    expect(page).to have_content("Rating: #{@review_1.rating}")
    expect(page).to have_content("Rating: #{@review_2.rating}")
    expect(page).to have_content("Rating: #{@review_3.rating}")

    expect(page).to have_content("Date written: #{@review_1.created_at}")
    expect(page).to have_content("Date written: #{@review_2.created_at}")
    expect(page).to have_content("Date written: #{@review_3.created_at}")
    #add link and image content tests

    expect(page).to have_link('Delete Review')
  end

  it 'can delete a review' do
    visit review_path(@review_1.username)
    #need to add within
    click_link 'Delete Review'

    expect(current_path).to eq(@review_1.book_id)
    expect(page).to have_no_content(@review_1.title)

  end




end
