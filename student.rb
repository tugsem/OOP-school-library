require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, permission, classroom = 'Unknown')
    super(age, name, parent_permission: permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
