require_relative 'bitmap'
class BitmapEditor

  def initialize
    @bitmap = nil
  end

  def run(file)
    return puts 'please provide correct file' if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp.split(" ")
      case line[0]
      when 'I'
        generate_bitmap(line)
      when 'L'
        check_bitmap
        color_pixel(line)
      when 'V'
        check_bitmap
        draw_vertical_segment(line)
      when 'C'
        check_bitmap
        @bitmap.clear
      when 'H'
        draw_horizontal_segment(line)
      when 'S'
        check_bitmap
        @bitmap.print_map
      else
        puts 'unrecognised command :('
      end
    end
  end

  private

  def check_bitmap
    raise 'There is no image' if @bitmap.nil?
  end

  def draw_vertical_segment(line)
    x = to_coordinate(line[1])
    segment_range = (to_coordinate(line[2])..to_coordinate(line[3]))
    color = line[4].to_s
    @bitmap.draw_vertical_segment(segment_range, x, color)
  end

  def draw_horizontal_segment(line)
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
    x = to_coordinate(line[1])
    y = to_coordinate(line[2])
    color = line[3].to_s
    @bitmap.color_pixel(x, y, color)
  end
end
