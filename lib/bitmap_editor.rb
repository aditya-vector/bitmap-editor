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
        height = line[1].to_i
        width = line[2].to_i
        @bitmap = Array.new(width) { Array.new(height, 'O')  }
      when 'L'
        x = to_coordinate(line[1])
        y = to_coordinate(line[2])
        color = line[3].to_s
        color_pixel(x, y, color)
      when 'V'
        x = to_coordinate(line[1])
        upper_y = to_coordinate(line[2])
        lower_y = to_coordinate(line[3])
        color = line[4].to_s
        (upper_y..lower_y).map{ |elem| color_pixel(x, elem, color) }
      when 'C'
        @bitmap.map { |elem| elem.fill('O') }
      when 'H'
        left_x = to_coordinate(line[1])
        right_x = to_coordinate(line[2])
        y = to_coordinate(line[3])
        color = line[4].to_s
        (left_x..right_x).map{ |elem| color_pixel(elem, y, color) }
      when 'S'
        puts 'There is no image' if @bitmap.nil?
        puts @bitmap.map(&:join).join("\n")
      else
          puts 'unrecognised command :('
      end
    end
  end

  private

  def to_coordinate(elem)
    elem.to_i - 1
  end

  def color_pixel(x, y, color)
    @bitmap[y][x] = color
  end
end
