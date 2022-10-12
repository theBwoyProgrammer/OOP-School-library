require 'rspec/autorun'
require_relative '../ruby/rental'
require_relative '../ruby/teacher'
require_relative '../ruby/book'

describe Rental do
  it 'Test Rentals' do
    teacher = Teacher.new(1, 18, 'John', 'Math')
    book = Book.new('Abdollah', 'Maramagambo')
    rental = Rental.new('2022/10/12', book, teacher)

    expect(rental.date).to eq '2022/10/12'
    expect(rental.person.name).to eq 'John'
    expect(rental.book.title).to eq 'Maramagambo'
  end
end
