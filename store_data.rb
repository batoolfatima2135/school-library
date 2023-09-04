require './book_manager'
require './rental_manager'
require './person_manager'

class StoreData
  def store_books(all_books)
    data = all_books.map do |book|
      { title: book.title, author: book.author, rentals: book.rentals }
    end
    File.open(
      'Data/books.json', 'w'
    ) do |file|
      file.puts(data.to_json)
    end
  end

  def store_persons(all_persons)
    data = all_persons.map do |person|
      if person.instance_of?(Student)
        {
          type: 'student', id: person.id, age: person.age, name: person.name,
          parent_permission: person.parent_permission
        }
      else
        {
          type: 'teacher', id: person.id, age: person.age, name: person.name, specialization: person.specialization
        }
      end
    end
    File.open(
      'Data/persons.json', 'w'
    ) do |file|
      file.puts(data.to_json)
    end
  end

  def store_rentals(all_rentals)
    data = all_rentals.map do |rental|
      { date: rental[:date], book_index: rental[:book_index], person_index: rental[:person_index] }
    end
    File.open(
      'Data/rentals.json', 'w'
    ) do |file|
      file.puts(data.to_json)
    end
  end
end
