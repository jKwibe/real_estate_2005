
class House
  attr_reader :address, :price, :rooms
  def initialize(price, address)
    @price   = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    false
  end

  def rooms_from_category(room_category)
    @rooms.select{|room| room.category == room_category}
  end

  def area
    @rooms.map{|room| room.area}.inject(){|sum, area| sum + area}
  end
end
