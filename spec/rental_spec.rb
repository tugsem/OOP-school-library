require 'spec_helper'

describe Rental do
  it 'create new rental with date, book and name' do
    @person = Teacher.new(58, 'Max', 'CS')
    @book = Book.new('Harry Potter', 'Joanne Rolking')
    @rental = Rental.new('2022/08/03', @book, @person)

    expect(@rental.book.title).to eql(@book.title)
    expect(@rental.person.name).to eql(@person.name)
    expect(@rental).to be_an_instance_of Rental
  end
end
