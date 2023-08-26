require './person'
require './student'
require './teacher'
require './classroom'
require './rental'
require './book'

class App
  @@all_books = []
  @@all_persons = []

  def create_book(title, author)
    book = Book.new(title, author)
    @@all_books.push(book)
    puts "Book created successfully"
  end

  def create_person(person_code)
    if person_code == 1
      print "Age: "
      age = gets.chomp.to_i
      print "Name: "
      name = gets.chomp
      print "Has parent permission? [Y/N]: "
      permission = gets.chomp 
      person = Student.new(age, name, permission === 'n'|| 'N' ? false : true)
      @@all_persons.push(person)
    elsif person_code == 2
      print "Age: "
      age = gets.chomp.to_i
      print "Name: "
      name = gets.chomp 
      print "Specialization: "
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name )
      @@all_persons.push(person)
    else
      puts "Enter valid number"
      call(3)
    end    
    puts "Person created successfully"   
  end

  def list_books
     @@all_books.each do |book|
     puts "Title: \"#{book.title}\", Author: #{book.author}"
     end
  end

  def list_persons
     @@all_persons.each do |person|
     puts "[#{person.instance_of?(Student) ? "Student" : "Teacher"}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
     end
  end

  def create_rental
    puts "Select a book from the following list by number"
    @@all_books.each_with_index do |book, index|
    puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts "Select person from the following list by number"
    @@all_persons.each_with_index do |person, index|
    puts "#{index}) [#{person.instance_of?(Student) ? "Student" : "Teacher"}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print "Date: "
    date = gets.chomp
    Rental.new(date, @@all_books[book_index], @@all_persons[person_index])
    puts "Rental created successfully"
  end

  def get_rental(id)
    person = @@all_persons.find { |person| person.id == id }
    puts "Rentals:"
    person.rentals.each do |rental|
    puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end

