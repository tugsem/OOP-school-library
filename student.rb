require './person'

class Student < Person
  def initialize(classroom)
    super('Unknown', true, 13)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

student1 = Student.new(9)
student1.can_use_services?
student1.play_hooky
