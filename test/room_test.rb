require 'minitest/autorun'
require 'minitest/pride'

require './lib/room'
require './lib/house'

class RoomTest < Minitest::Test

  def test_it_exists
    room = Room.new(:bedroom, 10, 13)
    assert_instance_of Room, room
  end

  def test_it_is_initialized_with_parameters
    room = Room.new(:bedroom, 10, 13)
    assert_equal :bedroom, room.category
    assert_equal 130, room.area
  end

end
