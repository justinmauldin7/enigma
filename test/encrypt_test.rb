require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require 'date'
require 'pry'

class EncryptTest < Minitest::Test

  def test_it_exists
    encrypt = Encrypt.new("hello world", "02715", "040895")
    assert_instance_of Encrypt, encrypt
  end

  def test_it_has_atributes
    encrypt = Encrypt.new("hello world", "02715", "040895")
    assert_equal "hello world", encrypt.message
    assert_equal "02715", encrypt.key
    assert_equal "040895", encrypt.date
  end

  def test_it_can_convert_the_date_to_a_formatted_string
    encrypt = Encrypt.new("hello world", "02715")
    assert_equal "031118", encrypt.date
  end
end
