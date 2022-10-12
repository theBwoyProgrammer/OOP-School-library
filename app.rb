# rubocop:disable all
require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require 'date'
require 'json'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    @books.each_with_index { |book, i| print "(#{i}) Title: \"#{book.title}\", Author: \"#{book.author}\"\n" }
  end

  def list_people
    if @people.empty?
      puts '

      ************No person registered yet************'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) ID: #{person.id} name: #{person.name} age: #{person.age}"
      end
    end
  end

  def create_person
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
      id = Random.rand(1..100)
      student = Student.new(id, age, name, classroom, parent_permission: parent_permission)
      @people.push(student)
      puts 'Student has been created successfully'
    when 2
      print 'name: '
      name = gets.chomp
      print 'Age: '
      age = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      id = Random.rand(1..100)
      teacher = Teacher.new(id, age, name, specialization)
      @people.push(teacher)
      puts '
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      Teacher created successfully!
      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
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
    puts 'Select Book from the following list by number'
    list_books
    book_index = gets.chomp.to_i
    puts 'Select Person from the following list by number'
    list_people
    person_index = gets.chomp.to_i
    puts "Date: #{Date.today}"
    date = gets.chomp
    rental = Rental.new(date, books[book_index], people[person_index])
    @rentals.push(rental)
    puts '
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    Rental created successfully!
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
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
    File.write('books.json', data)
  end

  def store_rentals
    rentalstore = []
    @rentals.each { |rent| rentalstore.push({ date: rent.date, person: rent.person.name, book: rent.book.title }) }
    data = JSON.generate(rentalstore)
    File.write('rentals.json', data)
  end

  def store_person
    persons = []
    @people.each do |person|
      if person.instance_of?(Teacher)
        persons.push({ character: person.class,
                       id: person.id,
                       name: person.name,
                       age: person.age,
                       specialization: person.specialization })
      else
        persons.push({ character: person.class,
                       id: person.id,
                       age: person.age,
                       name: person.name,
                       classroom: person.classroom,
                       parent_permission: person.parent_permission })
      end
    end
    File.write('people.json', JSON.generate(persons))
  end

  def fetch
    if File.exist?('books.json')
      data = JSON.parse(File.read('books.json'))
      data.each { |book| @books << Book.new(book['author'], book['title']) }
    else
      puts "books.json file doesn't exist"
    end
    if File.exist?('people.json')
      fetch_people
    else
      puts "people.json file doesn't exist"
    end
    if File.exist?('rentals.json')
      if File.exist?('people.json') && File.exist?('books.json')
        data = JSON.parse(File.read('rentals.json'))
        if data == []
          puts 'rental storage is empty'
        else
          fetch_objects(data)
        end
      else
        puts "rentals cannot be fetched because people.json or books.json doesn't exist"
      end
    else
      puts "rentals.json file doesn't exist"
    end
  end
  def fetch_objects(data)
    data.each do |rent|
      index = nil
      @people.each_with_index { |person, index| index = index if person.name == rent['person'] }
      index = nil
      @books.each_with_index { |book, index| b_index = index if book.title == rent['book'] }
      create_rental(rent['date'], index, index) if index && index
    end
  end

  def fetch_people
    data = JSON.parse(File.read('people.json'))
    data.each do |person|
      @people << if person['character'] == 'Teacher'
                   Teacher.new(person['id'], person['age'], person['name'], person['specialization'])
                 else
                   Student.new(person['id'], person['age'], person['name'], person['classroom'],
                               person['parent_permission'])
                 end
    end
  end
end
# rubocop:enable all
