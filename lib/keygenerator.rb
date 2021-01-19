class KeyGenerator
  def initialize
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def split_keys(digits)
   digits.split('').each_cons(2).map do |pair|
      pair.join.to_i
    end
  end

  def create_offsets(arg_1)
    hold = []
    x = ((arg_1.to_i) ** 2).to_s[-4..-1].to_s[-4..-1].split('')
    hold << x.map(&:to_i)
    hold.flatten
  end

  def create_values(arg_1, arg_2)
    split = split_keys(arg_1)
    offset = create_offsets(arg_2)
    combine = [offset, split]
    combine.transpose.map {|x| x.reduce(:+)}
  end

  def final_shifts(create_values)
    hash = {A:create_values[0],B:create_values[1],C:create_values[2],D:create_values[3]}
  end

end
