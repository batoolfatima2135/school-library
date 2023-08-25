require './person'
require './classroom.rb'

class Student < Person
  attr_accessor :classroom
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name)

  end

   def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
  def play_hooky
    '¯\(ツ)/¯'
  end

end
class1 = Classroom.new("maths")
student1 = Student.new(12)
class1.add_student(student1)
puts student1.classroom.label
student2 = Student.new(15)
student2.classroom = class1
puts student2.classroom.label
puts class1.students.map { |student| student.age } 