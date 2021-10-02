# frozen_string_literal: true

# @param position [Integer]
# @return value [Float]
def element(position)
  (-1)**(position - 1) * Math.sin(position * 2) / position.to_f
end

# @return [Enumerator]
def elements
  Enumerator.new do |elements|
    1.step do |i|
      elements << (element i)
    end
  end
end

# @param enum [Enumerator]
# @param initial_value [Object]
# @return [Object]
def reduce_while(enum, initial_value)
  enum.each do |value|
    initial_value, should_break = yield initial_value, value
    return initial_value if should_break
  end
  initial_value
end

# @param epsilon [Numeric]
def series(epsilon)
  epsilon = epsilon.to_f
  reduce_while elements, 0.0 do |acc, value|
    [acc + value, epsilon >= (acc + value - 1.0).abs]
  end
end
