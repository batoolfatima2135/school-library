require './rental'

class RentalManager
  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def get_rental(id, all_persons)
    all_persons.find { |person| person.id == id }
  end
end
