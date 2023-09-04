require '././trimmer_decorator'

describe TrimmerDecorator do
  context 'Passing a name' do
    it 'should slice if sting is more than 10 char' do
      base_decorator_double = double('BaseDecorator', correct_name: 'mohammedfuhidy')
      trimmer = TrimmerDecorator.new(base_decorator_double)
      expect(trimmer.correct_name).to eq 'mohammedfu'
      expect(trimmer.correct_name.length).to be <= 10
    end
  end
end
