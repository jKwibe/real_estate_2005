
class House
  attr_reader :address, :price
  def initialize(price, address)
    @price   = price
    @address = address
  end
end
