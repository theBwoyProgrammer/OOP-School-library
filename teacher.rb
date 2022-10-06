require_relative 'person'

class Teacher < Person
  def initialize(specialization)
    super(age, name)
    @specialization = specialization
  end

  # Override can_use_services?
  def can_use_services?
    true
  end
end
