require_relative 'reader'
require_relative 'author'
require_relative 'book'
require_relative 'order'

class Library
  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books, @orders, @readers, @authors = [], [], [], []
  end

  def add_book(author, book_title)
    add_book_if_no_exist(author, book_title)
    add_author_if_no_exist(author, book_title)
  end

  def add_book_if_no_exist(author, book_title)
    return if @books.find {|book| book.title == book_title && book.author == author}
    @books << Book.new(author, book_title)
  end

  def add_author_if_no_exist(author, book_title)
    exist = @authors.find_index {|present_author| present_author.name == author}
    if exist
      @authors[exist].biography << book_title
    else
      @authors << Author.new(author, [book_title])
    end
  end

  def new_reader(name, details)
    return if @readers.find{|abonent| abonent.name == name}
    @readers << Reader.new(name, details)
  end

  def new_order(book_title, reader_name)
    the_book = @books.find{|book| book.title == book_title}
    raise "The book \"#{book_title}\" is not exists in the library!"  unless the_book
    the_reader = @readers.find{|reader| reader.name == reader_name}
    raise "The reader \"#{reader_name}\" does not registred in the library!" unless the_reader
  rescue => error
    puts 'Error in the order! ' + error.message
  else
    @orders << Order.new(the_book, the_reader)
  end

  def load_library_data(source)
    File.open('./base/library.' + source + '.dat') do |file|
      self.send(source + '=', Marshal.load(file) )
    end
  end

  def save_library_data(source)
    File.open('./base/library.' + source + '.dat', 'w+') do |file|
      Marshal.dump(self.send(source), file)
    end
  end

  def find_the_most_intensive_reader
    @orders.group_by{|order| order.reader.name}.max_by{|_,orders| orders.count}
  end

  def find_the_most_popular_book(books_count)
    @orders.group_by{|order| order.book.title}.max_by(books_count){|_,orders| orders.count}
  end

  def find_the_no_popular_book
    @orders.group_by{|order| order.book.title}.min_by{|_,orders| orders.count}
  end

end