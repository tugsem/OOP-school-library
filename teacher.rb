require "./person.rb"

class Teacher < Person
  def initialize(specialization)
    super("U" , false, 9)
    @specialization = specialization
  end

  def can_use_services?
    return true
  end
end

t = Teacher.new("math")
t.can_use_services?