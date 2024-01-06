# frozen_string_literal: true

# Class for performing calculations based on the entered number.
class First
  include Math
  attr_accessor :x

  def initialize(input_number)
    @x = input_number
  end

  def calculate
    denominator = (1 - Math.sin(4 * @x) * Math.cos(@x**2 + 18))

    return 'Деление на 0' if denominator.zero?

    result = (Math.sin(8 * @x).abs + 17) / denominator**2
    Math.sqrt(result)
  end
end

# Class for working with employee salary data.
class Payroll
  attr_accessor :names, :salaries

  def initialize(names, salaries)
    @names = names
    @salaries = salaries
  end

  def find_least_deviation_worker
    return 'Нет работников' if @salaries.empty?

    average_salary = @salaries.sum / @salaries.length.to_f
    least_deviation_index = @salaries.index(@salaries.min_by { |salary| (salary - average_salary).abs })
    @names[least_deviation_index]
  end

  def find_two_highest_salary_workers
    return 'Нет работников' if @names.empty?
    return 'Работников меньше двух' if @names.length < 2

    first_highest_salary_name = find_highest_salary_worker(@names, @salaries)
    names_copy = @names.dup
    salaries_copy = @salaries.dup
    names_copy.delete_at(@names.index(first_highest_salary_name))
    salaries_copy.delete_at(@names.index(first_highest_salary_name))

    second_highest_salary_name = find_highest_salary_worker(names_copy, salaries_copy)

    [first_highest_salary_name, second_highest_salary_name]
  end

  def find_highest_salary_worker(names_list, salaries_list)
    max_salary_index = salaries_list.index(salaries_list.max)
    names_list[max_salary_index]
  end

  def remove_min_salary_worker
    return 'Нет работников' if @salaries.empty?

    min_salary_index = @salaries.index(@salaries.min)
    min_salary_name = @names[min_salary_index]
    min_salary = @salaries[min_salary_index]
    @names.delete_at(min_salary_index)
    @salaries.delete_at(min_salary_index)
    [min_salary_name, min_salary]
  end
end

# Class for correcting strings in a sequence.
class StringCorrector
  attr_accessor :input_sequence

  def initialize(input_sequence)
    @input_sequence = input_sequence
  end

  def correct_string(input_string)
    corrected_string = input_string.strip # Removes leading and trailing spaces
    corrected_string = corrected_string.split(/\s+/).reject { |word| word.length == 1 }.join(' ')
    # \s+ - any whitespace character, one or more times
    corrected_string
  end

  def process_sequence
    corrected_sequence = @input_sequence.map { |line| correct_string(line) }
    [@input_sequence, corrected_sequence]
  end
end
