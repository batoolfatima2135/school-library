require './rental'

class RentalManager
  attr_reader :all_rentals

  def initialize
    @all_rentals = []
  end

  def create_rental(date, all_books, all_persons, book_index, person_index)
    book = all_books[book_index]
    person = all_persons[person_index]
    Rental.new(date, book, person)
    @all_rentals.push({ date: date, book_index: book_index, person_index: person_index })
  end

  def get_rental(id, all_persons)
    all_persons.find { |person| person.id == id }
  end
end
