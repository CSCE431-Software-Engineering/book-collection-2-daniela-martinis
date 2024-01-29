require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(title: 'First Book', author: 'Author A', price: 29.99, published_date: Date.new(2001, 2, 15)),
      Book.create!(title: 'Second Book', author: 'Author B', price: 19.99, published_date: Date.new(2002, 5, 8))
    ])
  end

  it "renders a list of books" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, count: 2
  end
end
