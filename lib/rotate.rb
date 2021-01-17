class Rotate
  def initialize
  end

  def alphabet
    ("a".."z").to_a << " "
  end

  def rotate_words(message, shifts)
    new_word = []
    message.each_char do |letter|
      if alphabet.include?(letter)
        new_word << rotate_letters(letter, shifts[0])
        shifts.rotate!
      else
      new_word << letter
      end 
    end
    new_word.join
  end

  def rotate_letters(letter, shift)
    x = alphabet.zip(alphabet.rotate(shift)).to_h
    x[letter]
  end
end
