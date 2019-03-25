require 'rails_helper'

RSpec.describe 'user show page', type: :feature do
  describe 'shows book information' do
    it 'shows user information' do

      visit review_path(:username)


end
