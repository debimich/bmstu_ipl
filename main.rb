# frozen_string_literal: true

# Class for performing calculations of series sums
class First
  def calculate_sum(epsilon)
    sum = 0
    term = 1.0

    while term >= epsilon
      sum += term
      term /= 2.0
    end

    sum
  end

  def calculate_sum_with_epsilon
    [calculate_sum(1e-4), calculate_sum(1e-5)]
  end
end

# Class for performing calculations of series sums with Enumerator
class Second
  def calculate_sum(epsilon)
    list = Enumerator.new do |yielder|
      sum = 0.0
      prev = counter = 0.5

      loop do
        yielder.yield sum, prev, counter

        prev = sum
        sum += 1.0 / (counter *= 2)
      end
    end
    list.take_while { |sum, prev| (prev - sum).abs > epsilon }.last[0]
  end

  def calculate_sum_with_epsilon
    [calculate_sum(1e-4), calculate_sum(1e-5)]
  end
end

# Class for performing calculations of integration
class Third
  include Math
  def trap(left, right, num, &block)
    h = (right - left) / num.to_f
    result = (block.call(left) + block.call(right)) / 2.0

    1.upto(num - 1) do |i|
      result += block.call(left + i * h)
    end

    result *= h
  end
end
