require 'spec_helper'

describe Teacher do
  it 'create new teacher with age, name and specialization' do
    @teacher = Teacher.new(28, 'Emily', 'Maths')

    expect(@teacher).to have_attributes(age: 28)
    expect(@teacher).to have_attributes(name: 'Emily')
    expect(@teacher).to have_attributes(specialization: 'Maths')
    expect(@teacher).to be_an_instance_of Teacher
  end
end
