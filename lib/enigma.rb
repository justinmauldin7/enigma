class Enigma
  def date_conversion(date)
    date.strftime('%d%m%y')
  end

  def key_generator
    key = Random.new
    x = 0
    random_number = key.rand(1000..9999)
    "#{x}#{random_number}"
  end

  def message_decrypt(message, key = key_generator, date = date_conversion(Date.today))
    word = ""
    squared = squared_date(date)
    offset = offsets(squared)
    letters_array = message_array(message)
    letters_array.each_index do |index|
      if index % 4 == 0
        word << letter_unshift(a_shift(key, offset), letters_array[index])
      elsif index % 4 == 1
          word << letter_unshift(b_shift(key, offset), letters_array[index])
      elsif index % 4 == 2
            word << letter_unshift(c_shift(key, offset), letters_array[index])
      elsif index % 4 == 3
              word << letter_unshift(d_shift(key, offset), letters_array[index])
      end
    end
    word
  end

  def encrypt(message, key = key_generator, date = date_conversion(Date.today))
    {encryption: message_encrypt(message, key, date), key: key, date: date}
  end

  def decrypt(message, key = key_generator, date = date_conversion(Date.today))
    {decryption: message_decrypt(message, key, date), key: key, date: date}
  end
end
