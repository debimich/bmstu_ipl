# frozen_string_literal: true

require_relative 'main.rb'

puts 'Какая часть?'
part = gets.chomp.to_i

if part == 1
  obj = First.new
  obj.generate_random_file
  puts 'Количетсво слов состоящих из двух символов:'
  puts obj.count_two_char_words
elsif part == 2
  puts 'Введите длину и ширину доски:'
  param = gets.chomp.split.map(&:to_i)
  obj1 = Board.new(param[0], param[1])
  puts "Площадь доски: #{obj1.area}"
  obj1.param_return
  puts "\nВведите длину, ширину и высоту ящика:"
  param = gets.chomp.split.map(&:to_i)
  obj2 = Box.new(param[0], param[1], param[2])
  puts "Объем ящика: #{obj2.volume}"
  obj2.param_return
end
