require_relative 'person.rb'

class Teacher < Person
    def initialize(specialization)
        @specialization = specialization
    end

    # Override can_use_services?
    def can_use_services?
    return true
    end
end

obj2 = Teacher.new('ride')
p obj2.can_use_services?