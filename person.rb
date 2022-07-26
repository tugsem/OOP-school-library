require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
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

  public

  def correct_name
    @name
  end
end
