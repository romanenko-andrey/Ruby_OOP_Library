require './classes/library.rb'

LIBRARY = Library.new

LIBRARY.add_book('Mark Twain','The Adventures of Huckleberry Finn')
LIBRARY.add_book('Mark Twain','The Adventures of Tom Sawyer')
LIBRARY.add_book('Ray Bradbury','Fahrenheit 451')
LIBRARY.add_book('Ernest Hemingway','The Old Man and the Sea')
LIBRARY.add_book('Ernest Hemingway','The Sun Also Rises')
LIBRARY.add_book('L. Frank Baum','The Wonderful Wizard of Oz')
LIBRARY.add_book('James Fenimore Cooper','The Last of the Mohicans')

LIBRARY.new_reader('Andrey', {:email=>'andrey@in.ua'})
LIBRARY.new_reader('Bob', {:email=>'bob@in.ua', :city=>'Kiev'})
LIBRARY.new_reader('Jane', {:email=>'jane@in.ua', :city=>'Dnepr', :street=>'12-th line', :house=>12})

LIBRARY.new_order('The Old Man and the Sea', 'Bob')
LIBRARY.new_order('The Sun Also Rises', 'Jane')
LIBRARY.new_order('The Old Man and the Sea', 'Jane')
LIBRARY.new_order('The Adventures of Tom Sawyer', 'Andrey')
LIBRARY.new_order('Fahrenheit 451', 'Bob')
LIBRARY.new_order('The Sun Also Rises', 'Andrey')
LIBRARY.new_order('The Wonderful Wizard of Oz', 'Jane')
LIBRARY.new_order('The Last of the Mohicans', 'Andrey')
LIBRARY.new_order('The Last of the Mohicans', 'Jane')
LIBRARY.new_order('The Sun Also Rises', 'Bob')

LIBRARY.new_order('The Old Man and the Sea', 'No_Reader')
LIBRARY.new_order('No Book', 'Bob')

puts "books count = #{LIBRARY.books.count}"
puts "author count = #{LIBRARY.authors.count}"
puts "readers count = #{LIBRARY.readers.count}"
puts "orders count = #{LIBRARY.orders.count}"

LIBRARY.save_library_data('books')
LIBRARY.save_library_data('orders')
LIBRARY.save_library_data('readers')
LIBRARY.save_library_data('authors')