require_relative '../teacher'

describe Teacher do
  context 'When add teacher information' do
    teacher = Teacher.new(age: 29, specialization: 'Programming', name: 'Moha')

    it 'creates a new teacher with the given parameters' do
      expect(teacher).to be_instance_of Teacher
    end

    it 'should have always permission to use services' do
      expect(teacher.can_use_services).to eql true
    end
  end
end