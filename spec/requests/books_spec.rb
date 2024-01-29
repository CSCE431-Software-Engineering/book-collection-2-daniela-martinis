require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/books", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Book. As you add validations to Book, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { title: 'Valid Book Title', author: 'Your Mom', price: 19.99, published_date: Date.today }
  }

  let(:invalid_attributes) {
    { title: '' }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Book.create! valid_attributes
      get books_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      book = Book.create! valid_attributes
      get book_url(book)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_book_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      book = Book.create! valid_attributes
      get edit_book_url(book)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Book" do
        expect {
          post books_url, params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
      end

      it "redirects to the created book" do
        post books_url, params: { book: valid_attributes }
        expect(response).to redirect_to(book_url(Book.last))
        follow_redirect!
        expect(response.body).to include('Book was successfully created.')
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book" do
        expect {
          post books_url, params: { book: invalid_attributes }
        }.to change(Book, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post books_url, params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: 'Updated Book Title', author: 'New Author', price: 29.99, published_date: Date.tomorrow }
      }

      it "updates the requested book" do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(book.title).to eq(new_attributes[:title])
        expect(book.author).to eq(new_attributes[:author])
        expect(book.price).to eq(new_attributes[:price])
        expect(book.published_date).to eq(new_attributes[:published_date])
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: new_attributes }
        book.reload
        expect(response).to redirect_to(book_url(book))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        book = Book.create! valid_attributes
        patch book_url(book), params: { book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete book_url(book)
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete book_url(book)
      expect(response).to redirect_to(books_url)
    end
  end
end
