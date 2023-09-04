require './person'
require './student'
require './teacher'
require './classroom'
require './book'

class App
  def initialize(person_manager, book_manager, rental_manager)
    @person_manager = person_manager
    @book_manager = book_manager
    @rental_manager = rental_manager
  end

  def execute_option(number)
    case number
    when 1
      @book_manager.list_books
    when 2
      @person_manager.list_persons
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental(@book_manager.all_books, @person_manager.all_persons)
    when 6
      get_rental(@person_manager.all_persons)
    else
      puts 'Enter valid number'
      main
    end
    puts 'Person created successfully'
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission_values = %w[n N]
    person = Student.new(age, name, permission_values.include?(permission))
    @all_persons.push(person)
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    @all_persons.push(person)
  end

  def list_books
    puts @all_books.inspect
    @all_books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_persons
    @all_persons.each do |person|
      person_type = person.instance_of?(Student) ? 'Student' : 'Teacher'
      puts "[#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    all_books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select person from the following list by number'
    all_persons.each_with_index do |person, index|
      person_type = person.instance_of?(Student) ? 'Student' : 'Teacher'
      puts "#{index})[#{person_type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rental_manager.create_rental(date, all_books[book_index], all_persons[person_index])
    puts 'Rental created successfully'
  end

  def get_rental(all_persons)
    print 'ID of person: '
    id = gets.chomp.to_i
    person = @rental_manager.get_rental(id, all_persons)
    if person
      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'No rentals'
    end
  end

  def check_person_code(code, age, name)
    if code == 1
      create_student(age, name)
    else
      create_teacher(age, name)
    end
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission_values = %w[n N]
    @person_manager.create_student(age, name, permission_values.include?(permission))
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    @person_manager.create_teacher(age, name, specialization)
  end
end
