class Reader
  attr_accessor :name, :email, :city, :street, :house
  def initialize(name, details = {})
    #email = nil, city = nil, street = nil, house = nil
    @name = name
    @email = details[:email]
    @city = details[:city]
    @street = details[:street]
    @house = details[:house]
  end
end