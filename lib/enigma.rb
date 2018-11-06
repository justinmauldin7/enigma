class Enigma

  def date_conversion(date)
    date.strftime('%d%m%y')
  end

  def key_generator
    key = Random.new
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

def character_set
  ["a", "b", "c", "d", "e", "f", "g", "h", "i",
     "j", "k", "l", "m", "n", "o", "p", "q", "r",
      "s", "t", "u", "v", "w", "x", "y", "z", " "]
end

def message_array(message)
  message.downcase.chars
end

def letter_shift(shift, letter)
  if character_set.include?(letter)
    index = character_set.index(letter)
    character_set.rotate(shift)[index]
  else
    letter
  end
end

def message_encrypt(message, key, date)
  word = ""
  squared = squared_date(date)
  offset = offsets(squared)
  letters_array = message_array(message)
  letters_array.each_index do |index|
    if index % 4 == 0
      word << letter_shift(a_shift(key, offset), letters_array[index])
    elsif index % 4 == 1
        word << letter_shift(b_shift(key, offset), letters_array[index])
    elsif index % 4 == 2
          word << letter_shift(c_shift(key, offset), letters_array[index])
    elsif index % 4 == 3
            word << letter_shift(d_shift(key, offset), letters_array[index])
    end
  end
  word
end

def letter_unshift(shift, letter)
  if character_set.include?(letter)
    index = character_set.index(letter)
    character_set.rotate(-(shift))[index]
  else
    letter
  end
end

def encrypt(message, key, date = Date.today)
end

def decrypt(ciphertext, key, date = Date.today)
end


end
