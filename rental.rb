require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals.push(self)
    person.rentals.push(self)
  end
end

book = Book.new('John Doe', 'Scoops')
person = Person.new(22, 'maximilianus')
obj4 = Rental.new('2020-10-25', book, person)
p obj4.date
puts obj4.book.title
puts obj4.person.name
puts obj4.person.age
puts obj4.book.author
puts obj4.date
