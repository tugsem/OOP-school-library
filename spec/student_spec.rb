require 'spec_helper'

describe Student do
  it 'create new student with age and name' do
    @student = Student.new(12, 'Frank', false, '9C')

    expect(@student).to have_attributes(age: 12)
    expect(@student).to have_attributes(name: 'Frank')
    expect(@student).to have_attributes(parent_permission: false)
    expect(@student).to have_attributes(classroom: '9C')
    expect(@student).to be_an_instance_of Student
  end
end
