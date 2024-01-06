# frozen_string_literal: true

require_relative 'main.rb'

# Define a InteractionModule where the Math module is included.
module InteractionModule
  include Math

  puts 'Какая часть?'
  part = gets.chomp.to_i

  if part == 1
    obj = First.new
    puts "\nРезультат суммы при epsilon = 1e-4:"
    puts obj.calculate_sum_with_epsilon[0]
    puts "\nРезультат суммы при epsilon = 1e-5:"
    puts obj.calculate_sum_with_epsilon[1]
  elsif part == 2
    obj = Second.new
    puts "\nРезультат суммы при epsilon = 1e-4:"
    puts obj.calculate_sum_with_epsilon[0]
    puts "\nРезультат суммы при epsilon = 1e-5:"
    puts obj.calculate_sum_with_epsilon[1]
  elsif part == 3
    obj = Third.new

    puts 'Введите число отрезков разбиения:'
    n = gets.chomp.to_f

    puts 'Функция x + cos(x)'
    func = ->(x) { x + Math.cos(x) }
    result_lambda = obj.trap(-1, 4, n, &func)
    puts "Результат с использованием lambda: #{result_lambda}"

    result_block = obj.trap(-1, 4, n) { |x| x + Math.cos(x) }
    puts "Результат с использованием блока: #{result_block}"

    puts 'Функция tan(x + 1)/(x + 1)'
    func = ->(x) { Math.tan(x + 1) / (x + 1) }
    result_lambda = obj.trap(1, 2, n, &func)
    puts "Результат с использованием lambda: #{result_lambda}"

    result_block = obj.trap(1, 2, n) { |x| Math.tan(x + 1) / (x + 1) }
    puts "Результат с использованием блока: #{result_block}"
  end
end
