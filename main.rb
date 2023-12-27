include Math

class First
  attr_accessor :x

  def initialize(x)
    @x = x
  end

  def calculate
    denominator = (1 - Math.sin(4 * x) * Math.cos(x**2 + 18))

    return 'Деление на 0' if denominator.zero?

    result = (Math.sin(8 * x).abs + 17) / denominator**2
    Math.sqrt(result)
  end
end

class Payroll
  attr_accessor :names, :salaries

  def initialize(names, salaries)
    @names = names
    @salaries = salaries
  end

  def find_least_deviation_worker
    return 'Нет работников' if salaries.empty?

    average_salary = salaries.sum / salaries.length.to_f
    least_deviation_index = salaries.index(salaries.min_by { |salary| (salary - average_salary).abs })
    names[least_deviation_index]
  end

  def find_two_highest_salary_workers
    return 'Нет работников' if names.empty?

    names_copy = names.dup
    salaries_copy = salaries.dup
    first_max_salary_index = salaries_copy.index(salaries_copy.max)
    first_highest_salary_name = names_copy[first_max_salary_index]
    names_copy.delete_at(first_max_salary_index)
    salaries_copy.delete_at(first_max_salary_index)
    return 'Работников меньше двух' if names_copy.empty?

    second_max_salary_index = salaries_copy.index(salaries_copy.max)
    second_highest_salary_name = names_copy[second_max_salary_index]
    [first_highest_salary_name, second_highest_salary_name]
  end

  def remove_min_salary_worker
    return 'Нет работников' if salaries.empty?

    min_salary_index = salaries.index(salaries.min)
    min_salary_name = names[min_salary_index]
    min_salary = salaries[min_salary_index]
    names.delete_at(min_salary_index)
    salaries.delete_at(min_salary_index)
    [min_salary_name, min_salary]
  end
end

class StringCorrector
  attr_accessor :input_sequence

  def initialize(input_sequence)
    @input_sequence = input_sequence
  end

  def correct_string(input_string)
    corrected_string = input_string.strip # Удаляет пробелы в начале и в конце строки
    corrected_string = corrected_string.split(/\s+/).reject { |word| word.length == 1 }.join(' ') # \s+ - любой пробельный символ, повторяющийся один и более раз
    corrected_string
  end

  def process_sequence
    corrected_sequence = input_sequence.map { |line| correct_string(line) }
    [input_sequence, corrected_sequence]
  end
end
