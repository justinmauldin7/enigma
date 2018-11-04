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

  def test_it_encrypts_a_message_with_todays_date
    skip
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world", "02715")
    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: Date.today
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
      date: Date.today
    }
    assert_equal expected, enigma.decrypt(encrypted, "02715")
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
end
