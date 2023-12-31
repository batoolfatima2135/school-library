require './student'
require './teacher'

class PersonManager
  attr_accessor :all_persons

  def initialize
    @all_persons = []
  end

  def list_persons
    @all_persons.each do |person|
      person_type = person.instance_of?(Student) ? 'Student' : 'Teacher'
      puts "[#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_student(age, name, permission, id = nil)
    person = Student.new(age, name, permission, id)
    @all_persons.push(person)
  end

  def create_teacher(age, name, specialization, id = nil)
    person = Teacher.new(age, name, specialization, id)
    @all_persons.push(person)
  end
end
