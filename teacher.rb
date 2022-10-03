require_relative 'person'

class Teacher < Person
  def initialize(specialization)
    @specialization = specialization
  end

  # Override can_use_services?
  def can_use_services?
    true
  end
end

obj2 = Teacher.new('ride')
p obj2.can_use_services?
