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

  def test_it_encripts_a_message
    enigma = Enigma.new
    expected =
         {
       encryption: "keder ohulw",
       key: "02715",
       date: "040895"
     }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end
end
