require "./person.rb"

class Student < Person
  def initialize(classroom)
    super("Unknown", true, 13)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

end

student_1 = Student.new(9)
student_1.can_use_services?()
student_1.play_hooky()