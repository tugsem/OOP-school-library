require './person'

class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    (is_of_age? || @parent_permission == true)
  end

  private

  def of_age?
    (return unless @age >= 18)
  end
end

person1 = Person.new('p', false, 18)
person2 = Person.new('t', true, 12)
person3 = Person.new('z', false, 10)

person1.can_use_services?
person2.can_use_services?
person3.can_use_services?
