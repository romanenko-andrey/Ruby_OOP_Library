class Order
  attr_accessor :book, :reader, :date
  def initialize(book, reader)
    @book = book
    @reader = reader
    @date = Time.now
  end
end