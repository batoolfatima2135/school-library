require '././rental.rb'
require 'spec_helper'

describe Rental do
  context 'Create objects correctly' do
    before(:each) do
      @book = double('Book')
      @person = double('Person')
      @date = '12/12/20'
    end
    it 'Creates an object of the Rental class' do
      
      expect(described_class).to receive(:new).with(@date, @book, @person)
      Rental.new(@date, @book, @person)
    end
  end

end