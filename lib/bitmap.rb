require 'pry'
class Bitmap
  def initialize(width:, height:)
    @width = width
    @height = height
    verify_default_bounds(width, height)
    @bitmap = Array.new(height) { Array.new(width, 'O')  }
  end

  def color_pixel(x, y, color)
    verify_bitmap_bounds(x.to_i, y.to_i)
    x = to_coordinate(x)
    y = to_coordinate(y)
    @bitmap[y][x] = color.to_s
  end

  def print_map
    puts @bitmap.map(&:join).join("\n")
  end

  def draw_vertical_segment(segment_start, segment_end, x, color)
    segment_range = segment_start..segment_end
    segment_range.map{ |elem| color_pixel(x, elem, color) }
  end

  def draw_horizontal_segment(segment_start, segment_end, y, color)
    segment_range = segment_start..segment_end
    segment_range.map{ |elem| color_pixel(elem, y, color) }
  end

  def fill_bitmap(x, y, color)
    verify_bitmap_bounds(x.to_i, y.to_i)
    x = to_coordinate(x)
    y = to_coordinate(y)
    current_pixel_color = @bitmap[y][x]
    fill_array = [[x, y]]
    while coord = fill_array.shift
      @bitmap[coord[1]][coord[0]] = color.to_s # TODO: Refactor
      adjacent_pixels =  get_adjacent_pixels(*coord) # get pixels adjacent to given pixel
      # Iterate and add correct adjacent pixels to fill_array
      adjacent_pixels.each do |coord|
        fill_array << coord if valid_fill_pixel?(*coord, current_pixel_color)
      end
      fill_array.uniq!
    end
  end

  def get_adjacent_pixels(x, y)
    [[x - 1, y], [x + 1, y], [x, y - 1], [x, y + 1]]
  end

  def valid_fill_pixel?(height, width, current_pixel_color)
    return false if (invalid_bounds?(width.to_i + 1, @width) || invalid_bounds?(height.to_i + 1, @height)) # TODO: refactor
    current_pixel_color == @bitmap[width][height]
  end

  def clear
    @bitmap.map { |elem| elem.fill('O') }
  end

  private

  def verify_default_bounds(width, height)
    return unless (invalid_bounds?(width) || invalid_bounds?(height))
    raise 'Arguments out of bound'
  end

  def verify_bitmap_bounds(width, height)
    return unless (invalid_bounds?(width, @width) || invalid_bounds?(height, @height))
    raise 'Arguments out of bound for given bitmap'
  end

  def invalid_bounds?(coord, limit=250)
    coord > limit || coord < 1
  end

  def to_coordinate(elem)
    # Bitmap starts at 1. So, transforming the elem to array coordinates
    elem.to_i - 1
  end
end
