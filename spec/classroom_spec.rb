require 'spec_helper'

describe Classroom do
  it 'create new person with age and name' do
    @classroom = Classroom.new('C.S.')

    expect(@classroom).to have_attributes(label: 'C.S.')
    expect(@classroom).to be_an_instance_of Classroom
  end
end
