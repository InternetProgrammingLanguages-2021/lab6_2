# frozen_string_literal: true

require './main'

puts 'Here is some series computing'
puts "epsilon = 10^(-3), sum = #{series 1e-3}"
puts "epsilon = 10^(-4), sum = #{series 1e-4}"

