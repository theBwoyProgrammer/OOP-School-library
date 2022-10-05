require_relative 'person'

class Student < Person
attr_reader :classroom

  def initialize(classroom = 'unknown')
    super(age, name)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

obj1 = Student.new('3')
p obj1.play_hooky
