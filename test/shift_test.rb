require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift'

class ShiftTest < Minitest::Test

  def test_a_shift_class_exists
    shift = Shift.new
    assert_instance_of Shift, shift
  end

  def test_you_can_square_the_date
    shift = Shift.new
    date = "061118"
    assert_equal 3735409924, shift.squared_date(date)
  end

  def test_you_can_get_4_digit_offset
    shift = Shift.new
    date = "061118"
    squared_date = shift.squared_date(date)
    assert_equal "9924", shift.offsets(squared_date)
  end

  def test_the_shift_total_for_a_b_c_and_d
    shift = Shift.new
    date = "061118"
    key = "02715"
    squared_date = shift.squared_date(date)
    offsets = shift.offsets(squared_date)
    assert_equal 11 , shift.a_shift(key, offsets)
    assert_equal 36 , shift.b_shift(key, offsets)
    assert_equal 73 , shift.c_shift(key, offsets)
    assert_equal 19 , shift.d_shift(key, offsets)
  end

  def test_there_is_a_character_set
    shift = Shift.new
    assert_equal 27, shift.character_set.length
  end

  def test_it_can_return_an_array_of_the_message
    shift = Shift.new
    message = "hello world"
    assert_equal 11, shift.message_array(message).length
  end

  def test_it_can_shift_a_single_letter
    shift = Shift.new
    assert_equal "s", shift.letter_shift(11, "h")
  end

  def test_it_can_unshift_a_single_letter
    shift = Shift.new
    assert_equal "h", shift.letter_shift(11, "s")
  end
end
