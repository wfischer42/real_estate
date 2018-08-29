require 'minitest/autorun'
require 'minitest/pride'

require './lib/house'

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

  def test_it_can_list_rooms_for_a_given_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    bedrooms = house.rooms_from_category(:bedroom)
    basements = house.rooms_from_category(:basement)

    assert bedrooms.include?(room_1)
    assert bedrooms.include?(room_2)
    refute bedrooms.include?(room_3)

    assert basements.include?(room_4)
    refute basements.include?(room_3)
  end

  def test_it_can_calculate_total_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end

  def test_it_can_calculate_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 210.53, house.price_per_square_foot
  end

  def test_it_can_sort_rooms_by_area
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_2)
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)

    assert_equal [room_1, room_2, room_3, room_4], house.rooms_sorted_by_area
  end

  def test_it_can_list_all_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_2)
    house.add_room(room_4)
    house.add_room(room_1)
    house.add_room(room_3)

    rooms = house.rooms_by_category

    assert rooms[:bedroom].include?(room_1)
    assert rooms[:bedroom].include?(room_2)
    assert rooms[:living_room].include?(room_3)
    assert rooms[:basement].include?(room_4)
  end

end
