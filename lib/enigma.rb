class Enigma
  def encrypt(message, key, date = Date.today)
  end

  def decrypt(ciphertext, key, date)
  end

  def date_conversion(date)
    date_string = ""
    date_array = date.to_s.split('-')
    two_digit_array = date_array.map do |index|
      index[-2..-1]
    end
  two_digit_array.rotate(1).each do |index|
    date_string << index
    end
    date_string
  end
end
