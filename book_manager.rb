require './book'

class BookManager
  attr_accessor :all_books

  def initialize
    @all_books = []
  end

  def create_book(title, author)
    book = Book.new(title, author)
    @all_books.push(book)
  end

  def list_books
    @all_books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end
end
