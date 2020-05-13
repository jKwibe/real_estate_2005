

require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require "./lib/house"

class HouseTest < Minitest::Test
  def test_it_exists
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_it_has_address_and_price
    # skip
    house = House.new("$400000", "123 sugar lane")

    assert_equal "$400000", house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_it_has_rooms
    # skip
    house = House.new("$400000", "123 sugar lane")

    assert_equal [], house.rooms
  end

  def test_it_can_add_room
    # skip
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal 2 , house.rooms.size
    assert_instance_of Room, house.rooms[0]
    assert_instance_of Room, house.rooms[1]
  end

  def test_it_is_above_average
    # skip
    house = House.new("$400000", "123 sugar lane")

    assert_equal false, house.above_market_average?
  end

  def test_it_has_a_category
    # skip
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 4, house.rooms.size

    assert_equal 2, house.rooms_from_category(:bedroom).size
    assert_equal 1, house.rooms_from_category(:basement).size
  end

  def test_it_has_area
    # skip
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 4, house.rooms.size

    assert_equal 1900, house.area
  end

  def test_it_has_details
    # skip
    house = House.new("$400000", "123 sugar lane")

    assert_equal ["price", "address"], house.details.keys
  end

  def test_it_has_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)
    assert_equal 210.53, house.price_per_square_foot
  end

  def test_it_has_room_sorted_by_area
    # skip
    house = House.new("$400000", "123 sugar lane")

    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)
    house.add_room(room_2)

    assert_equal :bedroom, house.rooms_sorted_by_area.last.category
    assert_equal :basement, house.rooms_sorted_by_area.first.category
  end
end


# pry(main)> house = House.new("$400000", "123 sugar lane")
# #=> #<House:0x00007fccd30375f8...>
#
# pry(main)> room_1 = Room.new(:bedroom, 10, '13')
# #=> #<Room:0x00007fccd29b5720...>
#
# pry(main)> room_2 = Room.new(:bedroom, 11, '15')
# #=> #<Room:0x00007fccd2985f48...>
#
# pry(main)> room_3 = Room.new(:living_room, 25, '15')
# #=> #<Room:0x00007fccd383c2d0 @category=:living_room, @length=25, @width=15>
#
# pry(main)> room_4 = Room.new(:basement, 30, '41')
# #=> #<Room:0x00007fccd297dc30 @category=:basement, @length=30, @width=41>
#
# pry(main)> house.add_room(room_4)
#
# pry(main)> house.add_room(room_1)
#
# pry(main)> house.add_room(room_3)
#
# pry(main)> house.add_room(room_2)
#
# pry(main)> house.price_per_square_foot
# #=> 210.53
#
# pry(main)> house.rooms_sorted_by_area
# #=> [#<Room:0x00007fccd297dc30...>, #<Room:0x00007fccd383c2d0...>, #<Room:0x00007fccd2985f48...>, #<Room:0x00007fccd29b5720...>]
#
# pry(main)> house.rooms_by_category
# #=> {:bedroom=>[#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>], :living_room=> [#<Room:0x00007fccd383c2d0...>], :basement=> [#<Room:0x00007fccd297dc30...>]}
