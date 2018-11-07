require './lib/decryption'
require './lib/encryption'
require './lib/shift'
require 'date'

class Enigma
  attr_reader :encryption,
              :decryption

  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
  end

  def date_conversion(date)
    date.strftime('%d%m%y')
  end

  def key_generator
    key = Random.new
    x = 0
    random_number = key.rand(1000..9999)
    "#{x}#{random_number}"
  end

  def encrypt(message, key = key_generator, date = date_conversion(Date.today))
    {encryption: @encryption.message_encrypt(message, key, date), key: key, date: date}
  end

  def decrypt(message, key = key_generator, date = date_conversion(Date.today))
    {decryption: @decryption.message_decrypt(message, key, date), key: key, date: date}
  end
end
