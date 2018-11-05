class Enigma
  def encrypt(message, key, date = Date.today)
  end

  def decrypt(ciphertext, key, date = Date.today)
  end

  def date_conversion(date)
    date.strftime('%d%m%y')
  end

  def key_generator(key)
    x = 0
  random_number = key.rand(1000..9999)
  random_key = "#{x}#{random_number}"
  end

  def squared_date(date)
    date.to_i ** 2
  end

  def offsets(squared_date)
    squared_date.to_s[-4..-1]
  end

  def offsets_array(offsets)
    offsets.split('')
  end

  def keys_array(key)
    x = []
    x << key[0..1]
    x << key[1..2]
    x << key[2..3]
    x << key[3..4]
    x
  end

end
