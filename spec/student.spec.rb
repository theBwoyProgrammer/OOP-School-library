require 'rspec/autorun'
require_relative '../student'

describe Student do
  student = Student.new(1, 18, 'John', 'Math', true)
  it 'should return age, name, classroom and parent permission' do
    expect(student.age).to eql(18)
    expect(student.name).to eql('John')
    expect(student.classroom).to eql('Math')
    expect(student.parent_permission).to eql(true)
  end
end
