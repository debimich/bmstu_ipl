# frozen_string_literal: true

# Class that generate new file and count two char words
class First
  def generate_random_file
    File.open('F.txt', 'w') do |file|
      rand(10..15).times do
        random_word = rand(1..10).times.map { ('a'..'z').to_a.sample(rand(1..20)).join }.join(' ')
        file.puts(random_word)
      end
    end
  end

  def count_two_char_words
    words_count = 0
    File.open('F.txt', 'r') do |file|
      while (line = file.gets)
        line.split.each { |word| words_count += 1 if word.length == 2 }
      end
    end
    words_count
  end
end

# Class Board
class Board
  attr_accessor :length, :width

  def initialize(length, width)
    @length = length
    @width = width
  end

  def area
    @length * @width
  end

  def param_return
    puts "Доска: длина - #{@length}, ширина - #{@width}"
  end
end

# Class Box
class Box < Board
  attr_accessor :height

  def initialize(length, width, height)
    super(length, width)
    @height = height
  end

  def volume
    @length * @width * @height
  end

  def param_return
    puts "Ящик: длина - #{@length}, ширина - #{@width}, высота - #{@height}"
  end
end
