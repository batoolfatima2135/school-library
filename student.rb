require './person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, name, parent_permission, id)
    super(age, name)
    @id = id if id
    @parent_permission = parent_permission
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
