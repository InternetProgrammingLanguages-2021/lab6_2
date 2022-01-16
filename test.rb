# frozen_string_literal: true

require 'minitest/autorun'
require './main'
# Tests to check if series are properly counted
class TestSeries < Minitest::Test
  def test_element
    assert_in_epsilon Math.sin(2), SeriesUtil.element(1), 1e-20
  end

  def test_precision_alpha
    epsilon = 1e-3
    assert_in_epsilon 1, SeriesUtil.series(epsilon), epsilon
  end

  def test_precision_beta
    epsilon = 1e-4
    assert_in_epsilon 1, SeriesUtil.series(epsilon), epsilon
  end
end
