class Person
  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  # Getters
  attr_reader :id

  attr_accessor :name, :age

  # Setter

  # Public
  def can_use_services?
    is_of_age? || @parent_permission
  end
  public :can_use_services?

  # Private method
  private

  def is_of_age?
    if @age >= 18
      true
    elsif @age < 18
      false
    end
  end
end

obj = Person.new('Hatim', 35, parent_permission: true)
p obj.name = 'Ruby'
p obj.age = 44
p obj.id
p obj.can_use_services?
