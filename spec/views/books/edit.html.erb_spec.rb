require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  let(:book) {
    Book.create!(title: 'harry potter', author: 'jk rowling', price: 9.99, published_date: Date.new(2000, 1, 1))
  }

  before(:each) do
    assign(:book, book)
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(book), "post" do
    end
  end
end
