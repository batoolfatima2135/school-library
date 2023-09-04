require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'It should create classroom and add student' do
    classroom = Classroom.new('Math')
    student = Student.new(23,'Mohammed',true, nil)

    it 'should create a classroom' do
     expect(classroom).to be_instance_of Classroom
    end

    it 'should add new student to classroom' do
      classroom.add_student(student)
      expect(student.classroom.label).to eq 'Math'
    end
  end
end