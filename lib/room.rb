class Room
  attr_reader :category
  def initialize(category, length, width)
    @category = category
    @length = length
    @width = width
  end

  def area
    @length * @width.to_i
  end

  def is_painted?
    false
  end
end
