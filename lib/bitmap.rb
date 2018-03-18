class Bitmap
  def initialize(width:, height:)
    verify_default_bounds(width, height)
    @bitmap = Array.new(width) { Array.new(height, 'O')  }
  end

  def color_pixel(x, y, color)
    @bitmap[y][x] = color
  end

  def print_map
    puts @bitmap.map(&:join).join("\n")
  end

  def draw_vertical_segment(segment_range, x, color)
    segment_range.map{ |elem| color_pixel(x, elem, color) }
  end

  def draw_horizontal_segment(segment_range, y, color)
    segment_range.map{ |elem| color_pixel(elem, y, color) }
  end

  def clear
    @bitmap.map { |elem| elem.fill('O') }
  end

  private

  def verify_default_bounds(width, height)
    return unless width > 250 || height > 250
    raise 'Arguments out of bound'
  end
end
