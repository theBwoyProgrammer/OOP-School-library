require 'rspec/autorun'
require_relative '../teacher'

describe Teacher do
  teacher = Teacher.new(1, 18, 'John', 'Math')
  it 'should return age, name, classroom and parent permission' do
    expect(teacher.age).to eql(18)
    expect(teacher.name).to eql('John')
    expect(teacher.specialization).to eql('Math')
  end
end
