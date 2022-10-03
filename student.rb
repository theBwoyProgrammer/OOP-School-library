require_relative 'person.rb'

class Student < Person
    def initialize(classroom)
        @classroom = classroom
    end
    def play_hooky
        '¯\(ツ)/¯'
    end
end

obj1 = Student.new('3')
p obj1.play_hooky