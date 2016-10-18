require_relative 'reader'
require_relative 'author'
require_relative 'book'
require_relative 'order'

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books, @orders, @readers, @authors = [], [], [], []
  end

  def add_book(author, title)
    @books << Book.new(author, title)
    index = @authors.find_index {|a| a.name == author}
    if index
      @authors[index].biography << title
    else
      @authors << Author.new(author, [title])
    end
  end

  def new_reader(name, details)
    @readers << Reader.new(name, details)
  end

  def new_order(book_title, reader_name)
    the_book = @books.find{|b| b.title == book_title}
    the_reader = @readers.find{|b| b.name == reader_name}
    @orders << Order.new(the_book, the_reader)
  end

  def load_library_data(source)
    File.open('./base/library.' + source + '.dat') do |file|
      self.send(source + '=', Marshal.load(file))
    end
  end

  def save_library_data(source)
    File.open('./base/library.' + source + '.dat', 'w+') do |file|
      Marshal.dump(self.send(source), file)
    end
  end
end