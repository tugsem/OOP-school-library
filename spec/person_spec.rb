require 'spec_helper'

describe Person do
  it 'create new person with age and name' do
    @people = Person.new(20, 'Max')

    expect(@people).to have_attributes(age: 20)
    expect(@people).to have_attributes(name: 'Max')
    expect(@people).to be_an_instance_of Person
  end
end
