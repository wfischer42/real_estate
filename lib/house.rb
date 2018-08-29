require './lib/room'

class House
  attr_reader :price,
              :address

  def initialize(price, address)
    @price = convert_price(price)
    @address = address
  end

  def convert_price(price)
    stripped = price.tr('$,', '')
    stripped.to_i
  end

end
