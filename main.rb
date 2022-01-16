# frozen_string_literal: true

# class containing utils for series
class SeriesUtil
  def self.element(position)
    (-1)**(position - 1) * Math.sin(position * 2) / position.to_f
  end

  def self.enum(elements)
    1.step do |index|
      elements << (element index)
    end
  end

  def self.elements
    Enumerator.new do |elements|
      enum(elements)
    end
  end

  def self.reduce_while(enum, initial_value)
    enum.each do |value|
      initial_value, should_break = yield initial_value, value
      return initial_value if should_break
    end
    initial_value
  end

  def self.series(epsilon)
    epsilon = epsilon.to_f
    reduce_while elements, 0.0 do |acc, value|
      result = acc + value
      [result, epsilon >= (result - 1.0).abs]
    end
  end
end
