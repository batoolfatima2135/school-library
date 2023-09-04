require '././book'
require '././rental'

describe Book do
  context 'should create object correctly' do
    before(:each) do
      @book = Book.new 'title', 'author'
    end

    it 'Create Book object' do
      expect(@book).to be_instance_of Book
    end

    it 'Have parameters title and author' do
      expect(@book).to have_attributes(title: 'title', author: 'author')
    end
  end

  context 'should add rentals' do
    before(:each) do
      @book = Book.new 'title', 'author'
      @person = double('Person')
      @date = '12/12/12'
      @rental = double('Rental')
    end

    it 'should send rental class correct parameters' do
      allow(Rental).to receive(:new).with(@date, @book, @person)
      @book.add_rental(@date, @person)
    end

    it 'should get rental object' do
 \
      allow(Rental).to receive(:new).and_return(@rental)
      @book.add_rental(@date, @person)
    end
  end
end
