require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(id, age, name, classroom, parent_permission )
    super(id, age, name,  parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
