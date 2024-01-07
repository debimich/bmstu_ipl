# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main.rb'

# Test class to check the functionality of the main methods.
class Test < Minitest::Test
  def test_generate_random_file
    obj = First.new
    obj.generate_random_file
    assert File.exist?('F.txt')
  end

  def test_count_two_char_words_first
    obj = First.new
    File.open('F.txt', 'w') do |file|
      file.puts 'aebgdr cd eqrcwef grh ij kl'
    end
    result = obj.count_two_char_words
    assert_equal 3, result
  end

  def test_count_two_char_words_second
    obj = First.new
    File.open('F.txt', 'w') do |file|
      file.puts 'aebgdr cd eqrcwef grh ij kl'
      file.puts 'ds cfdsd eqrcwef gafdrh ifadsj kfdsl'
      file.puts 'aebgdr eqdrcwef grh'
    end
    result = obj.count_two_char_words
    assert_equal 4, result
  end

  def test_count_two_char_words_third
    obj = First.new
    File.open('F.txt', 'w') do |file|
      file.puts 'aebgdr cfdFE eqrcwef grh feifaj feklaf'
    end
    result = obj.count_two_char_words
    assert_equal 0, result
  end

  def setup
    @board = Board.new(5, 8)
    @box = Box.new(3, 4, 2)
  end

  def test_board_area
    assert_equal 40, @board.area
  end

  def test_box_volume
    assert_equal 24, @box.volume
  end

  def test_board_param_return
    assert_output("Доска: длина - 5, ширина - 8\n") { @board.param_return }
  end

  def test_box_param_return
    assert_output("Ящик: длина - 3, ширина - 4, высота - 2\n") { @box.param_return }
  end

  def test_board_is_kind_of_board
    assert_kind_of Board, @board
  end

  def test_box_is_kind_of_box
    assert_kind_of Box, @box
  end

  def test_box_is_kind_of_board
    assert_kind_of Board, @box
  end

  def test_board_is_not_kind_of_box
    refute_kind_of Box, @board
  end
end
