require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @hash = Hash.new
  end

  # Insert a Pixel at x,  y
  def insert(pixel, x, y)
    pixel.x = x
    pixel.y = y

    @hash[[x,y]] = pixel
  end

  def at(x, y)
    @hash.each do |coordinates,value|
      if [x,y] == coordinates
        return value
      end
    end

    return nil
  end

  private

  def inbounds(x, y)
  end

end
