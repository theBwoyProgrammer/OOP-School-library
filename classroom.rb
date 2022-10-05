class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def student(param)
    @students.push(param)
    param.classroom = self
  end
end
