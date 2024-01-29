require 'rails_helper'

RSpec.describe Book, type: :model do
    subject do
        described_class.new(title: 'harry potter', author: 'jk rowling', price: 9.99, published_date: Date.new(2000, 1, 1))
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a name' do
        subject.title = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without an author' do
        subject.author = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid with a negative price' do
        subject.price = -5
        expect(subject).not_to be_valid
    end

    it 'is not valid with an invalid published date' do
        subject.published_date = 'invalid_date'
        expect(subject).not_to be_valid
    end
end
