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
    x, segment_start, segment_end, color = line.drop(1)
    @bitmap.draw_vertical_segment(segment_start, segment_end, x, color)
  end

  def draw_horizontal_segment(line)
    check_bitmap
    segment_start, segment_end, y, color = line.drop(1)
    @bitmap.draw_horizontal_segment(segment_start, segment_end, y, color)
  end

  def generate_bitmap(line)
    @bitmap = Bitmap.new(width: line[1].to_i, height: line[2].to_i)
  end

  def color_pixel(line)
    check_bitmap
    x, y, color = line.drop(1)
    @bitmap.color_pixel(x, y, color)
  end

  def fill_bitmap(line)
    x, y, color = line.drop(1)
    @bitmap.fill_bitmap(x, y, color)
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
      'C' => proc { clear_bitmap },
      'S' => proc { print_bitmap },
      'F' => ->(line) { fill_bitmap(line) }
    }
    @instructions.default = proc { puts 'unrecognised command :(' }
  end
end
