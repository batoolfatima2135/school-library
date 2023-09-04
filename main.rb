require './app'
require './book_manager'
require './rental_manager'
require './person_manager'

class Main
  def initialize
    @person_manager = PersonManager.new
    @book_manager = BookManager.new
    @rental_manager = RentalManager.new
  end

  def display_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      display_options
      number = gets.chomp.to_i
      if number == 7
        exit_app
        break
      end
      app = App.new(@person_manager, @book_manager, @rental_manager)
      app.execute_option(number)
    end
  end

  def exit_app
    puts 'Thank you for using this App'
  end
end

main = Main.new
main.run
