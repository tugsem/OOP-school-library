require './nameable'
require './rental'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  attr_reader :id, :rentals
  attr_accessor :name, :age

  def can_use_services?
    (is_of_age? || @parent_permission == true)
  end

  private

  def of_age?
    (return unless @age >= 18)
  end

  public

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
