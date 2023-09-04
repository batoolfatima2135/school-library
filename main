#!/usr/bin/env ruby
require './app'
require './book_manager'
require './rental_manager'
require './person_manager'
require './store_data'
require './retrive_data'

class Main
  def initialize
    @person_manager = PersonManager.new
    @book_manager = BookManager.new
    @rental_manager = RentalManager.new
    @store_data = StoreData.new
    @retrive_data = RetriveData.new
  end

  def display_options
    puts
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
    @retrive_data.get_books(@book_manager)
    @retrive_data.get_persons(@person_manager)
    @retrive_data.get_rentals(@rental_manager, @person_manager.all_persons, @book_manager.all_books)
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
    @store_data.store_books(@book_manager.all_books)
    @store_data.store_persons(@person_manager.all_persons)
    @store_data.store_rentals(@rental_manager.all_rentals)
  end
end

main = Main.new
main.run
