require './nameable'
require './capitilize_decorator'
require './trimmer_decorator'
require './rental.rb'
require './book.rb'


class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    @age >= 18 || @parent_permission
  end

  def correct_name
    @name
  end

  def rentals
    @rentals
  end

  private

  def of_age?
    @age && @age >= 18
  end

 
end

book1 = Book.new("book1", "author1")
person1 = Person.new(12)

rental1 = Rental.new("2017-12-22", book1, person1)

