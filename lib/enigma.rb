class Enigma
  def initialize
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def convert_date
    Date.today.strftime("%m%d%y")
  end

  def key_numbers
    5.times.map do |num|
        rand(9)
    end.join
  end

  def split_keys(digits)
   digits.split('').each_cons(2).map do |pair|
      pair.join.to_i
    end
  end

  def create_offsets(date)
    

  # def encrypt(message, key = default_key, date = default_date)
  #   {encryption: cipher,
  #               key: key,
  #               date: date}
  # end
end
