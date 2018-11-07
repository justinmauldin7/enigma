require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encryption'
require 'date'
require 'pry'

class EncryptionTest < Minitest::Test
  
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
