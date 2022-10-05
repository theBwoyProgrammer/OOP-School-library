class Book
  attr_accessor :author, :title, :rentals

  def initialize(author, title)
    @author = author
    @title = title
    @rentals = []
  end
end
