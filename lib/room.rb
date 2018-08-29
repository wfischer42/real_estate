class Room
  attr_reader :category,
              :area
              
  def initialize(category, width, height)
    @category = category
    @area = width * height
  end

end
