require 'rspec/autorun'
require_relative 'book'
require_relative 'person'
require_relative 'classroom'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

describe Book do
  book = Book.new('Abdollah', 'Maramagambo')
  it 'should return author name and book title' do
    expect(book.author).to eql('Abdollah')
    expect(book.title).to eql('Maramagambo')
  end
end

describe Person do
  person = Person.new(1, 18, 'John', parent_permission: true)
  it 'should return age and name' do
    expect(person.age).to eql(18)
    expect(person.name).to eql('John')
  end
end

describe Student do
  student = Student.new(1, 18, 'John', 'Math', true)
  it 'should return age, name, classroom and parent permission' do
    expect(student.age).to eql(18)
    expect(student.name).to eql('John')
    expect(student.classroom).to eql('Math')
    expect(student.parent_permission).to eql(true)
  end
end

describe Teacher do
  teacher = Teacher.new(1, 18, 'John', 'Math')
  it 'should return age, name, classroom and parent permission' do
    expect(teacher.age).to eql(18)
    expect(teacher.name).to eql('John')
    expect(teacher.specialization).to eql('Math')
  end
end

describe Classroom do
  classroom = Classroom.new('Math')
  it 'has a label' do
    expect(classroom.label).to eq('Math')
  end
end

describe Rental do
  it 'has a date' do
    rental = Rental.new(date)
    expect(rental.date).to eq(12 / 13 / 2020)
  end
end
