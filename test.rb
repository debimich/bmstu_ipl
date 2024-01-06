# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'main.rb'

# Test class to check the functionality of the main methods.
class Test < Minitest::Test
  def test_first
    10.times do
      x = random_x_value
      m = First.new(x)
      result = calculate_result(m)
      expected_result = calculate_expected_result(x)
      assert_equal(expected_result, result)
    end
  end

  def random_x_value
    rand(-10.0..10.0)
  end

  def calculate_result(obj)
    obj.calculate.round(3)
  end

  def calculate_expected_result(inp)
    Math.sqrt((Math.sin(8 * inp).abs + 17) / (1 - Math.sin(4 * inp) * Math.cos(inp**2 + 18))**2).round(3)
  end

  def test_payroll_first
    names = %w[Alice Bob Charlie David Eva]
    salaries = [5000, 6000, 4500, 7000, 5500]

    assert_least_deviation_worker('Eva', names, salaries)
    assert_two_highest_salary_workers(%w[David Bob], names, salaries)
    assert_removed_min_salary_worker(['Charlie', 4500], names, salaries)
  end

  def test_payroll_second
    names = %w[Frank Grace Henry Isabel Jack]
    salaries = [8000, 5500, 6200, 7200, 4900]

    assert_least_deviation_worker('Henry', names, salaries)
    assert_two_highest_salary_workers(%w[Frank Isabel], names, salaries)
    assert_removed_min_salary_worker(['Jack', 4900], names, salaries)
  end

  def test_payroll_third
    names = %w[Kelly Liam Mia Nathan Olivia]
    salaries = [5300, 6800, 7200, 6000, 5500]

    assert_least_deviation_worker('Nathan', names, salaries)
    assert_two_highest_salary_workers(%w[Mia Liam], names, salaries)
    assert_removed_min_salary_worker(['Kelly', 5300], names, salaries)
  end

  def assert_least_deviation_worker(expected_name, names, salaries)
    payroll = Payroll.new(names, salaries)
    result = payroll.find_least_deviation_worker
    assert_instance_of String, result
    assert_equal expected_name, result
  end

  def assert_two_highest_salary_workers(expected_names, names, salaries)
    payroll = Payroll.new(names, salaries)
    result = payroll.find_two_highest_salary_workers
    assert_instance_of Array, result
    assert_equal expected_names, result
  end

  def assert_removed_min_salary_worker(expected_result, names, salaries)
    payroll = Payroll.new(names, salaries)
    result = payroll.remove_min_salary_worker
    assert_instance_of Array, result
    assert_equal expected_result, result
  end

  def test_string_corrector_1
    corrector = StringCorrector.new([])
    input_string = '  A  B C D E   '
    corrected_string = corrector.correct_string(input_string)
    assert_equal '', corrected_string
    input_string = ' X Y Z '
    corrected_string = corrector.correct_string(input_string)
    assert_equal '', corrected_string
  end

  def test_string_corrector_2
    corrector = StringCorrector.new([])
    input_sequence = 10.times.map { (('A'..'Z').to_a + [' ', ' ', ' ']).sample(rand(1..10)).join(' ') }
    corrector.input_sequence = input_sequence
    original_sequence, corrected_sequence = corrector.process_sequence
    corrected_sequence.each do |corrected_string|
      assert_equal corrected_string, corrector.correct_string(corrected_string)
    end
    assert_equal input_sequence, original_sequence
  end
end
