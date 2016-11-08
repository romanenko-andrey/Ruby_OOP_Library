require './classes/library.rb'

LIBRARY = Library.new

LIBRARY.load_library_data('books')
LIBRARY.load_library_data('orders')
LIBRARY.load_library_data('readers')
LIBRARY.load_library_data('authors')

puts 'Read books count = ' + LIBRARY.books.count.to_s
puts 'Read author count = ' + LIBRARY.authors.count.to_s
puts 'Read readers count = ' + LIBRARY.readers.count.to_s
puts 'Read orders count = ' + LIBRARY.orders.count.to_s


the_best_reader = LIBRARY.find_the_most_intensive_reader
puts "The most intensive reader is #{the_best_reader[0]}. He read #{the_best_reader[1].length} book!"

the_best_book = LIBRARY.find_the_most_popular_book(1)[0]
puts "The most popular book is #{the_best_book[0]}. It was read #{the_best_book[1].length} times!"

no_popular_book = LIBRARY.find_the_no_popular_book
puts "The not popular book is #{no_popular_book[0]}. It was read #{no_popular_book[1].length} times!"

tree_best_books = LIBRARY.find_the_most_popular_book(3)
puts 'Three popular books is: '
the_best_books_orders_count = 0
tree_best_books.each do |book|
  puts '    ' + book[0]
  the_best_books_orders_count += book[1].count
end
puts "it was read #{the_best_books_orders_count} times!"