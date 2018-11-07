class Decryption
  attr_reader :shift

  def initialize
    @shift = Shift.new
  end

  def message_decrypt(message, key, date)
    word = ""
    squared = @shift.squared_date(date)
    offset = @shift.offsets(squared)
    letters_array = @shift.message_array(message)
    letters_array.each_index do |index|
      if index % 4 == 0
        word << @shift.letter_unshift(@shift.a_shift(key, offset), letters_array[index])
      elsif index % 4 == 1
        word << @shift.letter_unshift(@shift.b_shift(key, offset), letters_array[index])
      elsif index % 4 == 2
        word << @shift.letter_unshift(@shift.c_shift(key, offset), letters_array[index])
      elsif index % 4 == 3
        word << @shift.letter_unshift(@shift.d_shift(key, offset), letters_array[index])
      end
    end
    word
  end
end
