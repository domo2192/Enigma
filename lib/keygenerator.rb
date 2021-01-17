class KeyGenerator
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

  def create_offsets(convert_date)
    hold = []
    require "pry"; binding.pry
    x = (convert_date.to_i)
    y = x ** 2
    a = y.to_s[-4..-1]
    a.split('')
    hold << a.split('').map(&:to_i)
    hold.flatten
  end

  def create_values(arg_1, arg_2)
    split = split_keys(arg_1)
    offset = create_offsets(arg_2)
    combine = [offset, split]
    combine.transpose.map {|x| x.reduce(:+)}
  end

  def final_shifts(values)
    hash = {A:values[0],B:values[1],C:values[2],D:values[3]}
  end

end
