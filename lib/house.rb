require './lib/room'

class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = convert_price(price)
    @address = address
    @rooms = []
  end

  def convert_price(price)
    stripped = price.tr('$,', '')
    stripped.to_i
  end

  def add_room(new_room)
    if new_room.class == Room
      @rooms << new_room
    end
  end
end
