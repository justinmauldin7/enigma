class Encryption
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
end
