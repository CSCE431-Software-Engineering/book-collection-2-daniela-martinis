require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    assign(:book, Book.create!(title: 'harry potter', author: 'jk rowling', price: 9.99, published_date: Date.new(2000, 1, 1)))
  end

  it "renders attributes in <p>" do
    render
  end
end
