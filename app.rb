require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require 'json'

class App
  attr_accessor :books, :teacher, :student, :rentals

  def initialize
    @books = []
    @teacher = []
    @student = []
    @rentals = []
  end

  def list_books
    @books.each_with_index { |book, i| print "(#{i}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n" }
  end

  def list_people
    people = [*@teacher, *@student]
    people.each_with_index { |person, i| print "(#{i}) Name: \"#{person.name}\", Age: \"#{person.age}\"\n" }
  end

  def create_person # rubocop:disable Metrics/MethodLength
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input = gets.chomp.to_i
    case input
    when 1
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Enter classroom:'
      classroom = gets.chomp
      print 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp.downcase == 'y'
      new_student = Student.new(age, classroom, name, parent_permission)
      new_student.name = name
      @student.push(new_student)
      puts 'Student has been created successfully'
    when 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Enter specialization: '
      specialization = gets.chomp
      new_teacher = Teacher.new(age, name, specialization)
      @people.push(new_teacher)
      puts 'Teacher has been created successfully'
    else
      puts 'Invalid option'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book has been created successfully'
  end

  def create_rental
    print "Select a book from the following list by number\n"
    list_books
    book = gets.chomp.to_i
    print "Select a person\n"
    list_people
    person = gets.chomp.to_i
    print 'Select Date: '
    date = gets.chomp
    people = [*@teacher, *@student]
    new_rental = Rental.new(date, @books[book], people[person])
    @rentals.push(new_rental)
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'Enter person ID: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == id
        print "Date: #{rental.date}, Book: \"#{rental.book.title}\" Author #{rental.book.author}\n"
      end
    end
  end
  def store_book
    bookstore = []
    @books.each { |book| bookstore.push({ title: book.title, author: book.author }) }
    data = JSON.generate(bookstore)
    File.write('book_list.json', data)
  end
  def store_rentals
    rentalstore = []
    @rentals.each { |rent| rentalstore.push({ date: rent.date, person: rent.person.name, book: rent.book.title }) }
    data = JSON.generate(rentalstore)
    File.write('rentals.json', data)
  end
  def store_person
    staff = []
    # students = []
    # persons = [*@teacher, *@student]
    @teacher.each { |teach| staff.push({ name: teach.name, age: teach.age, specialization: teach.specialization }) }
    # @student.each { |std| students.push({ type: student, id: std.id, name: std.name, age: std.age, classroom: std.classroom, parent_permission: std.parent_permission }) }
    data = JSON.generate(staff)
    File.write('people.json', data)
  end
end
