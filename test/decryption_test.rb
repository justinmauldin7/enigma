require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decryption'
require './lib/shift'

class DecryptionTest < Minitest::Test

  def test_a_decryption_class_exists
    decrypt = Decryption.new
    assert_instance_of Decryption, decrypt
  end

  def test_a_decryption_class_has_access_to_the_shift_class
    decrypt = Decryption.new
    assert_instance_of Shift, decrypt.shift
  end

  def test_you_can_square_the_date
    decrypt = Decryption.new
    date = "061118"
    assert_equal 3735409924, decrypt.shift.squared_date(date)
  end

  def test_you_can_get_4_digit_offset
    decrypt = Decryption.new
    date = "061118"
    squared_date = decrypt.shift.squared_date(date)
    assert_equal "9924", decrypt.shift.offsets(squared_date)
  end

  def test_it_can_return_an_array_of_the_message
    decrypt = Decryption.new
    message = "hello world"
    assert_equal 11, decrypt.shift.message_array(message).length
  end

  def test_there_is_a_character_set
    decrypt = Decryption.new
    assert_equal 27, decrypt.shift.character_set.length
  end

  def test_the_shift_total_for_a_b_c_and_d
    decrypt = Decryption.new
    date = "061118"
    key = "02715"
    squared_date = decrypt.shift.squared_date(date)
    offsets = decrypt.shift.offsets(squared_date)
    assert_equal 11 , decrypt.shift.a_shift(key, offsets)
    assert_equal 36 , decrypt.shift.b_shift(key, offsets)
    assert_equal 73 , decrypt.shift.c_shift(key, offsets)
    assert_equal 19 , decrypt.shift.d_shift(key, offsets)
  end

  def test_it_can_unshift_a_single_letter
    decrypt = Decryption.new
    assert_equal "c", decrypt.shift.letter_shift(11, "s")
  end

  def test_it_can_decrypt_a_message
    decrypt = Decryption.new
    date = "061118"
    key = "02715"
    message = "snddz"
    assert_equal "hello", decrypt.message_decrypt(message, key, date)
  end

  def test_it_can_decrypt_a_multiword_message
    decrypt = Decryption.new
    date = "061118"
    key = "02715"
    message_2 = "snddziogbuw"
    assert_equal "hello world", decrypt.message_decrypt(message_2, key, date)
  end

  def test_it_can_decrypt_a_multiword_message_with_special_characters
    decrypt = Decryption.new
    date = "061118"
    key = "02715"
    message_3 = "snddziogbuw!"
    assert_equal "hello world!", decrypt.message_decrypt(message_3, key, date)
  end
end
