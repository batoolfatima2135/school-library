require_relative '../capitilize_decorator.rb'

describe CapitalizeDecorator do
  context 'Passing a name' do
   it 'should return word with first capital letter' do
      base_decorator_double = double('BaseDecorator', correct_name: 'mohammed')
      capitalizer = CapitalizeDecorator.new(base_decorator_double)
      expect(capitalizer.correct_name).to eq 'MOHAMMED'
    end
  end
end