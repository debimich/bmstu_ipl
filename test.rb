require 'minitest/autorun'
require_relative 'main.rb'

class Test < Minitest::Test
  def test_first
    10.times do
      x = rand(-10.0..10.0)
      m = First.new(x)
      result = m.calculate.round(3)
      expected_result = Math.sqrt((Math.sin(8 * x).abs + 17) / (1 - Math.sin(4 * x) * Math.cos(x**2 + 18))**2).round(3)
      assert_equal(expected_result, result)
    end
  end

  def test_Payroll1
    names = %w[Alice Bob Charlie David Eva]
    salaries = [5000, 6000, 4500, 7000, 5500]

    payroll = Payroll.new(names, salaries)
    result1 = payroll.find_least_deviation_worker
    assert_instance_of String, result1
    assert_includes names, result1
    assert_equal 'Eva', result1

    result2 = payroll.find_two_highest_salary_workers
    assert_instance_of Array, result2
    assert_includes names, result2[0]
    assert_includes names, result2[1]
    assert_equal %w[David Bob], result2

    result3 = payroll.remove_min_salary_worker
    assert_instance_of Array, result3
    assert_equal ['Charlie', 4500], result3
  end

  def test_Payroll2
    names = %w[Frank Grace Henry Isabel Jack]
    salaries = [8000, 5500, 6200, 7200, 4900]

    payroll = Payroll.new(names, salaries)
    result1 = payroll.find_least_deviation_worker
    assert_instance_of String, result1
    assert_includes names, result1
    assert_equal 'Henry', result1

    result2 = payroll.find_two_highest_salary_workers
    assert_instance_of Array, result2
    assert_includes names, result2[0]
    assert_includes names, result2[1]
    assert_equal %w[Frank Isabel], result2

    result3 = payroll.remove_min_salary_worker
    assert_instance_of Array, result3
    assert_equal ['Jack', 4900], result3
  end

  def test_Payroll3
    names = %w[Kelly Liam Mia Nathan Olivia]
    salaries = [5300, 6800, 7200, 6000, 5500]

    payroll = Payroll.new(names, salaries)
    result1 = payroll.find_least_deviation_worker
    assert_instance_of String, result1
    assert_includes names, result1
    assert_equal 'Nathan', result1

    result2 = payroll.find_two_highest_salary_workers
    assert_instance_of Array, result2
    assert_includes names, result2[0]
    assert_includes names, result2[1]
    assert_equal %w[Mia Liam], result2

    result3 = payroll.remove_min_salary_worker
    assert_instance_of Array, result3
    assert_equal ['Kelly', 5300], result3
  end

  def Test_StringCorrector
    corrector = StringCorrector.new([])
    input_string = '  A  B C D E   '
    corrected_string = corrector.correct_string(input_string)
    assert_equal 'A B C D E', corrected_string
    input_string = ' X Y Z '
    corrected_string = corrector.correct_string(input_string)
    assert_equal '', corrected_string
    input_sequence = 10.times.map { (('A'..'Z').to_a + [' ', ' ', ' ']).sample(rand(1..10)).join(' ') }
    corrector.input_sequence = input_sequence
    original_sequence, corrected_sequence = corrector.process_sequence
    corrected_sequence.each do |corrected_string|
      assert_equal corrected_string, corrector.correct_string(corrected_string)
    end
    assert_equal input_sequence, original_sequence
  end
end
