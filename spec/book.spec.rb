require 'rspec/autorun'
require_relative '../ruby/book'

describe Book do
  book = Book.new('Abdollah', 'Maramagambo')
  it 'should return author name and book title' do
    expect(book.author).to eql('Abdollah')
    expect(book.title).to eql('Maramagambo')
  end
end
