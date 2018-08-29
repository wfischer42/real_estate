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
    stripped_price = price.tr('$,', '')
    stripped_price.to_i
  end

  def add_room(new_room)
    if new_room.class == Room
      @rooms << new_room
    end
  end

  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end

  def area
    @rooms.inject(0) do |area, room|
      area += room.area
    end
  end

  def price_per_square_foot
    ppsf = @price.to_f / area
    ppsf.round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end
  end

  def rooms_by_category
    hash = Hash.new([])
    @rooms.each do |room|
      hash[room.category] += [room]
    end
    return hash
  end

end
