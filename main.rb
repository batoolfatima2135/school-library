require './person'
require './rental'
require './book'

# Create instances
book1 = Book.new("book1", "author1")
person1 = Person.new(12)
rental1 = Rental.new("2017-12-22", book1, person1)

puts rental1.book.title
puts rental1.person.age