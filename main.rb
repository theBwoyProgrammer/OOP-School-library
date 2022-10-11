require_relative 'start'

class Main
  def initialize
    @app = App.new
    @input = 0
  end

  def option
    print 'Welcome to School Library App!'
    while @input != 7
      print "\nPlease choose an option by entering a number: \n\n"
      print "1 - List all books\n"
      print "2 - List all people\n"
      print "3 - Create a person\n"
      print "4 - Create a book\n"
      print "5 - Create a rental\n"
      print "6 - List all rentals for a given person id\n"
      print "7 - Exit\n"
      start_app
    end
    @app.store_book
    @app.store_rentals
    @app.store_person
    abort 'thank you!'
  end
end
main = Main.new
main.option
