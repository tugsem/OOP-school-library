require 'spec_helper'

describe Book do
  it 'create new book with title and author' do
    @book = Book.new('Dune', 'F. Herbert')

    expect(@book).to have_attributes(title: 'Dune')
    expect(@book).to have_attributes(author: 'F. Herbert')
    expect(@book).to be_an_instance_of Book
  end
end
