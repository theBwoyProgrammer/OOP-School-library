require 'rspec/autorun'
require_relative '../ruby/classroom'

describe Classroom do
  classroom = Classroom.new('Math')
  it 'has a label' do
    expect(classroom.label).to eq('Math')
  end
end
