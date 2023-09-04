require  '././book.rb'
require  '././rental.rb'

describe Book do 
  context "should create object correctly" do  
    before(:each) do 
      @book = Book.new "title", "author"
    end

    it "Create Book object" do
      expect(@book).to be_instance_of Book  
    end

    it "Have parameters title and author" do
      expect(@book).to have_attributes(title: 'title') 
      expect(@book).to have_attributes(author: 'author') 
    end
  end 

  context "should add rentals" do  
    before(:each) do 
      @book = Book.new "title", "author"
      @person = double('Person') 
    end

    it "should send rental class correct parameters" do  
      date = '12/12/12'
      rental_double = double('Rental')
      allow(Rental).to receive(:new).with(date, @book, @person)
      @book.add_rental(date, @person)    
    end 

    it "should get rental object" do  
      date = '12/12/12'
      rental_double = double('Rental')
      allow(Rental).to receive(:new).and_return(rental_double)
      @book.add_rental(date, @person) 
    end 
  end  
end
