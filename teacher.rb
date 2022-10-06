require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown')
    super(age, name)
    @specialization = specialization
    @name = name
    @age = age
  end

  # Override can_use_services?
  def can_use_services?
    true
  end
end
