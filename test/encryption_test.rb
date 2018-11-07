require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'
require './lib/shift'


class EncryptionTest < Minitest::Test

  def test_a_shift_class_exists
    encrypt = Encryption.new
    assert_instance_of Encryption, encrypt
  end

  def test_you_can_square_the_date
    encrypt = Encryption.new
    date = "061118"
    assert_equal 3735409924, encrypt.shift.squared_date(date)
  end

  def test_you_can_get_4_digit_offset
    encrypt = Encryption.new
    date = "061118"
    squared_date = encrypt.shift.squared_date(date)
    assert_equal "9924", encrypt.shift.offsets(squared_date)
  end

  def test_it_can_return_an_array_of_the_message
    encrypt = Encryption.new
    message = "hello world"
    assert_equal 11, encrypt.shift.message_array(message).length
  end

  def test_there_is_a_character_set
    encrypt = Encryption.new
    assert_equal 27, encrypt.shift.character_set.length
  end

  def test_the_shift_total_for_a_b_c_and_d
    encrypt = Encryption.new
    date = "061118"
    key = "02715"
    squared_date = encrypt.shift.squared_date(date)
    offsets = encrypt.shift.offsets(squared_date)
    assert_equal 11 , encrypt.shift.a_shift(key, offsets)
    assert_equal 36 , encrypt.shift.b_shift(key, offsets)
    assert_equal 73 , encrypt.shift.c_shift(key, offsets)
    assert_equal 19 , encrypt.shift.d_shift(key, offsets)
  end

  def test_it_can_shift_a_single_letter
    encrypt = Encryption.new
    assert_equal "s", encrypt.shift.letter_shift(11, "h")
  end

  def test_it_can_encrypt_a_message
    encrypt = Encryption.new
    date = "061118"
    key = "02715"
    message = "hello"
    assert_equal "snddz", encrypt.message_encrypt(message, key, date)
  end

  def test_it_can_encrypt_a_multiword_message
    encrypt = Encryption.new
    date = "061118"
    key = "02715"
    message = "hello world"
    assert_equal "snddziogbuw", encrypt.message_encrypt(message, key, date)
  end

  def test_it_can_encrypt_a_multiword_message_with_special_characters
    encrypt = Encryption.new
    date = "061118"
    key = "02715"
    message = "hello world!"
    assert_equal "snddziogbuw!", encrypt.message_encrypt(message, key, date)
  end

  def test_it_can_encrypt_a_multiword_message_with_capitalization
    encrypt = Encryption.new
    date = "061118"
    key = "02715"
    message = "HELLO world!"
    assert_equal "snddziogbuw!", encrypt.message_encrypt(message, key, date)
  end
end
