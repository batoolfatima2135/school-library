require '././person'

describe Person do

context "Create objects correctly" do
  before(:each) do 
      @person = Person.new "age", "name"
    end

  it "Create object of person class" do
      expect(@person).to be_instance_of Person
  end

  it "Pass aurgument correctly" do
    expect(@person).to have_attributes(age: "age")
    expect(@person).to have_attributes(name: "name")
  end

end

context ""
end