require './lib/keygenerator'
require './lib/rotate'
require './lib/randomable'

class Enigma < Rotate
  include Randomable
  def initialize
    @key_generator = KeyGenerator.new
  end

  def encrypt(message, key = key_numbers, date = convert_date)
    date = date.delete('/')
    shifts = @key_generator.create_values(key, date)
    { encryption: rotate_words(message, shifts),
      key: key,
      date: date }
  end

  def decrypt(message, key = key_numbers, date = convert_date)
    date = date.delete('/')
    shifts = @key_generator.create_values(key, date)
    negative = shifts.map(&:-@)
    { decryption: rotate_words(message, negative),
      key: key,
      date: date }
  end
end
