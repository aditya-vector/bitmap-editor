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
        x = line[1].to_i - 1
        y = line[2].to_i - 1
        color = line[3].to_s
        @bitmap[y][x] = color
      when 'S'
        puts 'There is no image' if @bitmap.nil?
        puts @bitmap.map(&:join).join("\n")
      else
          puts 'unrecognised command :('
      end
    end
  end
end
