class Book
  attr_accessor :author, :title, :rentals

  def initialize(author, title)
    @author = author
    @title = title
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end
end
