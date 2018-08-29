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

end
