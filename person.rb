require "./person.rb"

class Person
  def initialize(name = "Unknown", parent_permission = true, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_reader :name
  attr_reader :age
  attr_writer :name
  attr_writer :age

  def can_use_services?
    (is_of_age? || @parent_permission == true)
  end

  private

  def is_of_age?
    if @age >= 18
      return true
    end
  end
end

person_1 = Person.new("p", false, 18)
person_2 = Person.new("t", true, 12)
person_3 = Person.new("z", false, 10)

person_1.can_use_services?
person_2.can_use_services?
person_3.can_use_services?