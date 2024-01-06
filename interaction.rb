# frozen_string_literal: true

require_relative 'main.rb'

puts 'Какая часть?'
part = gets.chomp.to_i

if part == 1
  puts 'Введите число:'
  input_number = gets.chomp.to_f
  obj = First.new(input_number)
  puts obj.calculate
elsif part == 2
  puts 'Сколько работников?'
  number_of_employees = gets.chomp.to_i
  names = []
  salaries = []
  (1..number_of_employees).each do |i|
    puts "Введите фамилию работника #{i}:"
    names[i - 1] = gets.chomp
    puts "Введите зарплату для работника #{i}:"
    salaries[i - 1] = gets.chomp.to_f
  end
  obj = Payroll.new(names, salaries)
  puts "\nФамилия работника, зарплата которого наименее отклоняется от средней зарплаты всех работников:"
  puts obj.find_least_deviation_worker
  puts "\nФамилии двух работников с наибольшей зарплатой:"
  puts obj.find_two_highest_salary_workers
  puts "\nУдаленный работник с наименьшей зарплатой:"
  puts obj.remove_min_salary_worker
elsif part == 3
  puts 'Введите количество строк:'
  number_of_lines = gets.chomp.to_i
  input_lines = []
  number_of_lines.times do |i|
    puts "Введите строку #{i + 1}:"
    input_line = gets.chomp
    input_lines << input_line
  end
  string_corrector = StringCorrector.new(input_lines)
  original, corrected = string_corrector.process_sequence
  puts "\nИсходная последовательность строк:"
  puts original
  puts "\nСкорректированная последовательность строк:"
  puts corrected
end
