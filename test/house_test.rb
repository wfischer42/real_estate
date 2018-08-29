require 'minitest/autorun'
require 'minitest/pride'

require './lib/house'
require './lib/room'

class HouseTest < Minitest::Test

  def test_it_exists
    house = House.new("$400000", "123 sugar lane")
    assert_instance_of House, house
  end

  def test_it_can_convert_string_price_to_integer
    house = House.new("$400000", "123 sugar lane")
    assert_equal 1231231, house.convert_price("$1231231")
    assert_equal 1231231, house.convert_price("$1,231,231")
  end

  def test_it_is_initialized_with_parameters
    # skip
    house = House.new("$400000", "123 sugar lane")
    assert_equal 400000, house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_it_has_no_rooms_by_default
    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms
  end

  def test_rooms_can_be_added
    house = House.new("$400000", "123 sugar lane")

    assert_equal 0, house.rooms.size

    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal room_1, house.rooms[0]
    assert_equal room_2, house.rooms[1]
  end

end
