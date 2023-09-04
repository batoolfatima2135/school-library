require_relative '../capitilize_decorator.rb'

describe CapitalizeDecorator do
  context 'Passing a name' do
    capitalizer = CapitalizeDecorator.new
    it 'should return word with first capital letter' do
      expect(capitalizer.correct_name('mohammed')).to eq 'Mohammed'
    end
  end
end