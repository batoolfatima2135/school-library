require '././person'

describe Person do
  context 'Create objects correctly' do
    it 'Creates an object of the Person class' do
      expect(described_class).to receive(:new).with(25, 'John')
      Person.new(25, 'John')
    end

    it 'Passes arguments correctly' do
      person = described_class.new(25, 'John')
      expect(person).to have_attributes(age: 25, name: 'John')
    end
  end

  context '#can_use_services?' do
    it 'Returns true if person is of age' do
      person = described_class.new(18, 'Alice')
      expect(person.can_use_services?).to be(true)
    end

    it 'Returns false if person is not of age' do
      person = described_class.new(15, 'Bob', parent_permission: false)
      expect(person.can_use_services?).to be(false)
    end
  end

  context 'Should add rentals correctly' do
    before(:each) do
      @person = described_class.new(25, 'John')
      @book = double('Book')
      @date = '12/12/12'
    end

    it 'Sends Rental.new with correct parameters' do
      expect(Rental).to receive(:new).with(@date, @book, @person)
      @person.add_rental(@date, @book)
    end

    it 'Creates a rental object correctly' do
      rental = double('Rental')
      allow(Rental).to receive(:new).and_return(rental)
      expect(@person.add_rental(@date, @book)).to eq(rental)
    end
  end
end
