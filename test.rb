# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main.rb'

# Test class to check the functionality of the main methods.
class Test < Minitest::Test
  include Math
  def test_first_calculate_sum
    obj = First.new
    result = obj.calculate_sum(1e-4)
    assert_in_epsilon 2.0, result, 1e-4
    result = obj.calculate_sum(1e-5)
    assert_in_epsilon 2.0, result, 1e-5
  end

  def test_first_calculate_sum_with_epsilon
    obj = First.new
    result = obj.calculate_sum_with_epsilon
    assert_in_epsilon 2.0, result[0], 1e-4
    assert_in_epsilon 2.0, result[1], 1e-5
  end

  def test_second_calculate_sum
    obj = Second.new
    result = obj.calculate_sum(1e-4)
    assert_in_epsilon 2.0, result, 1e-4
    result = obj.calculate_sum(1e-5)
    assert_in_epsilon 2.0, result, 1e-5
  end

  def test_second_calculate_sum_with_epsilon
    obj = Second.new
    result = obj.calculate_sum_with_epsilon
    assert_in_epsilon 2.0, result[0], 1e-4
    assert_in_epsilon 2.0, result[1], 1e-5
  end

  def test_third_trap_f
    t = Third.new
    result = t.trap(0, 1, 100) { |x| x**2 }
    assert_in_epsilon 0.33333, result, 1e-4
  end

  def test_third_trap_s
    t = Third.new
    result = t.trap(-1, 4, 100) { |x| x + cos(x) }
    assert_in_epsilon 7.58465, result, 1e-4
  end

  def test_third_trap_t
    t = Third.new
    result = t.trap(1, 2, 100) { |x| tan(x + 1) / (x + 1) }
    assert_in_epsilon(-0.37689, result, 1e-4)
  end
end
