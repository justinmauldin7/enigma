class Enigma
  def encrypt(message, key, date = Date.today)
  end

  def decrypt(ciphertext, key, date = Date.today)
  end

  def date_conversion(date)
    date.strftime('%d%m%y')
  end
end
