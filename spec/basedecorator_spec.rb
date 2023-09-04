require_relative '../capitilize_decorator'

describe BaseDecorator do
  context 'Passing a name' do
    it 'should return name' do
      allow(Nameable_double).to receive(:correct_name).and_return('John')
      base_decorator = BaseDecorator.new(Nameable_double)
      expect(base_decorator.correct_name).to eq('John')
    end
  end
end
