
class House
  attr_reader :address, :price, :rooms
  def initialize(price, address)
    @price   = price
    @address = address
    @rooms = []
  end
end
