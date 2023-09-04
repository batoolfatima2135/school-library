require './book_manager'
class RetriveData
  def get_books(book_manager)
    return if File.empty?('Data/books.json')

    file = File.read('Data/books.json')
    data = JSON.parse(file, symbolize_names: true)
    data.each do |book_data|
      title = book_data[:title]
      author = book_data[:author]
      book_manager.create_book(title, author)
    end
  end

  def get_persons(person_manager)
    return if File.empty?('Data/persons.json')

    file = File.read('Data/persons.json')
    data = JSON.parse(file, symbolize_names: true)
    data.each do |person|
      name = person[:name]
      age = person[:age]
      id = person[:id]
      if person[:type] == 'student'
        parent_permission = person[:parent_permission]
        person_manager.create_student(age, name, parent_permission, id)
      else
        specialization = person[:specialization]
        person_manager.create_teacher(age, name, specialization, id)
      end
    end
  end

  def get_rentals(rental_manager, all_persons, all_books)
    return if File.empty?('Data/rentals.json')

    file = File.read('Data/rentals.json')
    data = JSON.parse(file, symbolize_names: true)
    data.each do |rental|
      person_index = rental[:person_index]
      book_index = rental[:book_index]
      date = rental[:date]
      rental_manager.create_rental(date, all_books, all_persons, book_index, person_index)
    end
  end
end
