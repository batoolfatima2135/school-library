require '././student'

describe Student do
  context 'Create objects correctly' do
    it 'Creates an object of the Student class' do
      expect(described_class).to receive(:new).with(15, 'John', true, 125)
      Student.new(15, 'John', true, 125)
    end

    it 'Passes arguments correctly' do
      student = described_class.new(15, 'John', true, 125)
      expect(student).to have_attributes(age: 15, name: 'John', parent_permission: true, id: 125)
    end
  end

  context 'Classroom' do
    it 'sets the classroom attribute' do
      student = described_class.new(15, 'John', true, nil)

      classroom = double('Classroom')
      allow(classroom).to receive(:students).and_return([])

      student.classroom = classroom

      expect(student.classroom).to eq(classroom)
    end

    it 'adds the student to the classroom' do
      student = described_class.new(15, 'John', true, nil)
      classroom = double('Classroom', students: [])

      student.classroom = classroom

      expect(classroom).to receive(:students)
      expect(classroom.students).to include(student)
    end

    it 'does not add the student to the classroom if already present' do
      student = described_class.new(15, 'John', true, nil)
      classroom = double('Classroom', students: [student])

      student.classroom = classroom

      expect(classroom.students.count(student)).to eq(1)
    end
  end

  context 'Play Hooky' do
    it 'returns the play hooky message' do
      student = described_class.new(15, 'John', true, nil)
      expect(student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end
end
