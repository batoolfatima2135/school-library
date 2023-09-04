require_relative '../trimmer_decorator.rb'

describe TrimmerDecorator do
  context 'Passing a name' do
    trimmer = TrimmerDecorator.new
    it 'should slice if sting is more than 10 char' do
      expect(trimmer.correct_name('mohammedfuhidy')).to eq 'mohammedfu'
      expect(trimmer.correct_name.length).to be <= 10
    end
  end
end