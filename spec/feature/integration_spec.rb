require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in 'book[author]', with: 'jk rowling'
        fill_in 'book[price]', with: '9.99'
        fill_in 'book[published_date]', with: '2000-01-01'
        click_on 'Create Book'

        expect(page).to have_content('Book was successfully created.')
        visit books_path
        expect(page).to have_content('harry potter')
    end
end
