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

  def a_shift(key, offsets)
    key[0..1].to_i + offsets[0].to_i
  end

  def b_shift(key, offsets)
    key[1..2].to_i + offsets[1].to_i
  end

  def c_shift(key, offsets)
    key[2..3].to_i + offsets[2].to_i
  end

  def d_shift(key, offsets)
    key[3..4].to_i + offsets[3].to_i
  end

  def shift_converter(shift)
    if shift < 27
      shift
    else
      shift.modulo(27)
    end
  end

end
