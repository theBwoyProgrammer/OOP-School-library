require_relative 'nameable'
require 'securerandom'

class Person < Nameable
  attr_accessor :id, :name, :age, :parent_permission
  attr_reader :rentals

  def initialize(id, age, name, parent_permission: true)
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? >= 18 || @parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
