require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'date'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_encrypts_a_message
    skip
    enigma = Enigma.new
    expected =
         {
       encryption: "keder ohulw",
       key: "02715",
       date: "040895"
     }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_decrypts_a_message
    skip
    enigma = Enigma.new
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_convert_todays_date_to_a_formatted_string
    enigma = Enigma.new
    assert_equal "051118", enigma.date_conversion(Date.today)
  end

  def test_it_encrypts_a_message_with_todays_date
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "031118"
    }
    assert_equal expected, encrypted
  end

  def test_it_decrypts_a_message_with_todays_date
    skip
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      encryption: "hello world",
      key: "02715",
      date: "031118"
    }
    assert_equal expected, enigma.decrypt(encrypted, "02715")
  end

  def test_it_can_generate_a_random_key
    enigma = Enigma.new
    random = Random.new
    key = enigma.key_generator(random)
    assert_equal true, (1000..9999).cover?(key.to_i)
  end

  def test_it_encrypts_a_message_with_todays_date_and_random_key
    skip
    enigma = Enigma.new
    expected = {
      encryption: "",
      key: "",
      date: Date.today
    }
    assert_equal expected, enigma.encrypt("hello world")
  end

  def test_you_can_square_the_date
    enigma = Enigma.new
    date = enigma.date_conversion(Date.today)
    assert_equal 2613049924, enigma.squared_date(date)
  end

  def test_you_can_get_4_digit_offset
    enigma = Enigma.new
    date = enigma.date_conversion(Date.today)
    squared_date = enigma.squared_date(date)
    assert_equal "9924", enigma.offsets(squared_date)
  end

  def test_you_can_get_an_array_of_your_4_digit_offset
    enigma = Enigma.new
    date = enigma.date_conversion(Date.today)
    squared_date = enigma.squared_date(date)
    offsets = enigma.offsets(squared_date)
    assert_equal ["9", "9", "2", "4"], enigma.offsets_array(offsets)
  end

  def test_you_can_get_an_array_of_keys
    enigma = Enigma.new
    date = enigma.date_conversion(Date.today)
    key = "02715"

    squared_date = enigma.squared_date(date)
    offsets = enigma.offsets(squared_date)
    offset_array = enigma.offsets_array(offsets)
    assert_equal ["02", "27", "71", "15"], enigma.keys_array(key)
  end

  def test_the_shift_total_for_a_b_c_and_d
    enigma = Enigma.new
    date = enigma.date_conversion(Date.today)
    key = "02715"

    squared_date = enigma.squared_date(date)
    offsets = enigma.offsets(squared_date)
    assert_equal 11 , enigma.a_shift("02715", offsets)
    assert_equal 36 , enigma.b_shift("02715", offsets)
    assert_equal 73 , enigma.c_shift("02715", offsets)
    assert_equal 19 , enigma.d_shift("02715", offsets)
  end
end
