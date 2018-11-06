require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'
require 'date'
require 'pry'

class EncryptionTest < Minitest::Test
  def test_you_can_square_the_date
    encrypt = Encryption.new
    date = "061118"
    assert_equal 3735409924, encrypt.squared_date(date)
  end

  def test_you_can_get_4_digit_offset
    encrypt = Encryption.new
    date = encrypt.date_conversion(Date.today)
    squared_date = encrypt.squared_date(date)
    assert_equal "9924", encrypt.offsets(squared_date)
  end

  def test_you_can_get_an_array_of_your_4_digit_offset
    encrypt = Encryption.new
    date = encrypt.date_conversion(Date.today)
    squared_date = encrypt.squared_date(date)
    offsets = encrypt.offsets(squared_date)
    assert_equal ["9", "9", "2", "4"], encrypt.offsets_array(offsets)
  end

  def test_the_shift_total_for_a_b_c_and_d
    encrypt = Encryption.new
    date = encrypt.date_conversion(Date.today)
    key = "02715"

    squared_date = encrypt.squared_date(date)
    offsets = encrypt.offsets(squared_date)
    assert_equal 11 , encrypt.a_shift(key, offsets)
    assert_equal 36 , encrypt.b_shift(key, offsets)
    assert_equal 73 , encrypt.c_shift(key, offsets)
    assert_equal 19 , encrypt.d_shift(key, offsets)
  end

  def test_the_shift_can_be_simplified
    encrypt = Encryption.new
    date = encrypt.date_conversion(Date.today)
    key = "02715"

    squared_date = encrypt.squared_date(date)
    offsets = encrypt.offsets(squared_date)
    a_shift = encrypt.a_shift(key, offsets)
    b_shift = encrypt.b_shift(key, offsets)
    c_shift = encrypt.c_shift(key, offsets)
    d_shift = encrypt.d_shift(key, offsets)
    assert_equal 11, encrypt.shift_converter(a_shift)
    assert_equal 9, encrypt.shift_converter(b_shift)
    assert_equal 19, encrypt.shift_converter(c_shift)
    assert_equal 19, encrypt.shift_converter(d_shift)
  end

  def test_there_is_a_character_set
    encrypt = Encryption.new
    assert_equal 27, encrypt.character_set.length
  end

  def test_it_can_return_an_array_of_the_message
    encrypt = Encryption.new
    message = "hello world"
    assert_equal 11, encrypt.message_array(message).length
  end

  def test_it_can_shift_a_single_letter
    encrypt = Encryption.new
    message = "h"
    assert_equal "s", encrypt.letter_shift(11, message)
  end

  def test_it_can_encrypt_a_message
    encrypt = Encryption.new
    date = encrypt.date_conversion(Date.today)
    key = "02715"
    message = "hello"
    assert_equal "snddz", encrypt.message_encrypt(message, key, date)
  end

  def test_it_can_encrypt_a_multiword_message
    encrypt = Encryption.new
    date = encrypt.date_conversion(Date.today)
    key = "02715"
    message_2 = "hello world"
    assert_equal "snddziogbuw", encrypt.message_encrypt(message_2, key, date)
  end

  def test_it_can_encrypt_a_multiword_message_with_special_characters
    encrypt = Encryption.new
    date = encrypt.date_conversion(Date.today)
    key = "02715"
    message_3 = "hello world!"
    assert_equal "snddziogbuw!", encrypt.message_encrypt(message_3, key, date)
  end

  def test_it_can_encrypt_a_multiword_message_with_capitalization
    encrypt = Encryption.new
    date = encrypt.date_conversion(Date.today)
    key = "02715"
    message_3 = "HELLO world!"
    assert_equal "snddziogbuw!", encrypt.message_encrypt(message_3, key, date)
  end
end
