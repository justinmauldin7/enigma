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
  random_number = key.rand(100..999)
  random_key = "#{x}#{random_number}"
  end

  def squared_date(date)
    date.to_i * date.to_i
  end

  def offsets(squared_date)
    squared_date.to_s[-4..-1]
  end

  def offsets_array(offsets)
    offsets.split('')
  end

  
end
