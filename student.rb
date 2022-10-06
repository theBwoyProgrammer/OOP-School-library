require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(name, parent_permission, classroom = 'unknown')
    super(age, name)
    @classroom = classroom
    @name = name
    @parent_permission = parent_permission
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
