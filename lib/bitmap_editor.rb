require_relative 'bitmap'

class BitmapEditor

  def initialize
    @bitmap = nil
    set_instructions
  end

  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp.split(" ")
      @instructions[line[0]].call(line)
    end
  end

  private

  def check_bitmap
    raise 'There is no image' if @bitmap.nil?
  end

  def draw_vertical_segment(line)
    check_bitmap
    x = to_coordinate(line[1])
    segment_range = (to_coordinate(line[2])..to_coordinate(line[3]))
    color = line[4].to_s
    @bitmap.draw_vertical_segment(segment_range, x, color)
  end

  def draw_horizontal_segment(line)
    check_bitmap
    segment_range = (to_coordinate(line[1])..to_coordinate(line[2]))
    y = to_coordinate(line[3])
    color = line[4].to_s
    @bitmap.draw_horizontal_segment(segment_range, y, color)
  end

  def generate_bitmap(line)
    @bitmap = Bitmap.new(width: line[2].to_i, height: line[1].to_i)
  end

  def to_coordinate(elem)
    elem.to_i - 1
  end

  def color_pixel(line)
    check_bitmap
    x = to_coordinate(line[1])
    y = to_coordinate(line[2])
    color = line[3].to_s
    @bitmap.color_pixel(x, y, color)
  end

  def clear_bitmap
    check_bitmap
    @bitmap.clear
  end

  def print_bitmap
    check_bitmap
    @bitmap.print_map
  end

  def set_instructions
    @instructions = {
      'I' => ->(line) { generate_bitmap(line) },
      'L' => ->(line) { color_pixel(line) },
      'V' => ->(line) { draw_vertical_segment(line) },
      'H' => ->(line) { draw_horizontal_segment(line) },
      'C' => ->(_) { clear_bitmap },
      'S' => ->(_) { print_bitmap }
    }
  end
end
