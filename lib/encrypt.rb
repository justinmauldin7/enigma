class Encrypt
  attr_reader :message,
              :key,
              :date

  def initialize(message, key, date = Date.today)
    @message = message
    @key = key
    @date = date
  end

  # def date_conversion
  #   @date.strftime('%d%m%y')
  # end
end
