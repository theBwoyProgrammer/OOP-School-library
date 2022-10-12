require 'rspec/autorun'
require_relative '../person'

describe Person do
  person = Person.new(1, 18, 'John', parent_permission: true)
  it 'should return age and name' do
    expect(person.age).to eql(18)
    expect(person.name).to eql('John')
  end
end
