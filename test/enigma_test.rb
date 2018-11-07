require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/decryption'
require './lib/encryption'
require './lib/shift'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_enigma_class_has_access_to_the_encryption_class
    enigma = Enigma.new
    assert_instance_of Encryption, enigma.encryption
  end

  def test_enigma_class_has_access_to_the_decryption_class
    enigma = Enigma.new
    assert_instance_of Decryption, enigma.decryption
  end

  def test_it_can_convert_todays_date_to_a_formatted_string
    enigma = Enigma.new
    assert_equal 6, enigma.date_conversion(Date.today).length
  end

  def test_it_can_generate_a_random_key
    enigma = Enigma.new
    key = enigma.key_generator
    assert_equal true, (1000..9999).cover?(key.to_i)
  end

  def test_it_encrypts_a_message
    enigma = Enigma.new
    expected =
         {
       encryption: "keder ohulw",
       key: "02715",
       date: "040895"
     }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_encrypts_a_message_with_todays_date
    enigma = Enigma.new
    assert_equal 11 , enigma.encrypt("hello world", "02715")[:encryption].length
    assert_equal 5 , enigma.encrypt("hello world", "02715")[:key].length
    assert_equal 6 , enigma.encrypt("hello world", "02715")[:date].length
  end

  def test_it_encrypts_a_message_with_todays_date_and_random_key
    enigma = Enigma.new
    binding.pry
    assert_equal 11 , enigma.encrypt("hello world")[:encryption].length
    assert_equal 5 , enigma.encrypt("hello world")[:key].length
    assert_equal 6 , enigma.encrypt("hello world")[:date].length
  end

  def test_it_decrypts_a_message
    enigma = Enigma.new
    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_decrypts_a_message_with_todays_date
    enigma = Enigma.new
    assert_equal "hello world", enigma.decrypt("snddziogbuw", "02715")[:decryption]
    assert_equal "02715", enigma.decrypt("snddziogbuw", "02715")[:key]
    assert_equal 6, enigma.decrypt("snddziogbuw", "02715")[:date].length
  end
end
