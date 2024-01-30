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
    scenario 'missing title' do
        visit new_book_path
        fill_in 'book[author]', with: 'jk rowling'
        fill_in 'book[price]', with: '9.99'
        fill_in 'book[published_date]', with: '2000-01-01'
        click_on 'Create Book'
    
        expect(page).to have_content("Title can't be blank")
    end
    scenario 'missing author' do
        visit new_book_path
        fill_in 'book[title]', with: 'harry potter'
        fill_in 'book[price]', with: '9.99'
        fill_in 'book[published_date]', with: '2000-01-01'
        click_on 'Create Book'
    
        expect(page).to have_content("Author can't be blank")
    end

    scenario 'invalid price' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in 'book[author]', with: 'jk rowling'
        fill_in 'book[price]', with: 'abc'
        fill_in 'book[published_date]', with: '2000-01-01'
        click_on 'Create Book'

        expect(page).to have_content('Price is not a number')
    end

    scenario 'invalid published date' do
        visit new_book_path
        fill_in "book[title]", with: 'harry potter'
        fill_in 'book[author]', with: 'jk rowling'
        fill_in 'book[price]', with: '9.99'
        fill_in 'book[published_date]', with: 'invalid_date'
        click_on 'Create Book'

        expect(page).to have_content('Published date can\'t be blank')
    end
end
