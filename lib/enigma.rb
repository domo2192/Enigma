require './lib/keygenerator'
require './lib/rotate'
require 'date'

class Enigma < Rotate
  def initialize
    @key_generator = KeyGenerator.new
  end


  def encrypt(message, key = @key_generator.key_numbers, date = @key_generator.convert_date)
    date = (date.delete('/'))
    shifts = @key_generator.create_values(key, date)
    { encryption: rotate_words(message, shifts),
            key: key,
           date: date}
  end

end
