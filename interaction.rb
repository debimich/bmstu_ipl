require_relative "main.rb"

puts "Какая часть?"
part = gets.chomp.to_i

if part == 1
  puts "Введите число:"
  input_number = gets.chomp.to_f
  obj = First.new(input_number)
  puts obj.calculate
elsif part == 2
  puts "Сколько работников?"
  number_of_employees = gets.chomp.to_i
  names = []
  salaries = []
  (1..number_of_employees).each do |i|
    puts "Введите фамилию работника #{i}:"
    names[i - 1] =  gets.chomp
    puts "Введите зарплату для работника #{i}:"
    salaries[i - 1] = gets.chomp.to_f
  end
  obj = Payroll.new(names, salaries)
  puts obj.find_least_deviation_worker
  puts obj.find_two_highest_salary_workers
  puts obj.remove_min_salary_worker
end
