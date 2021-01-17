require './test/test_helper'
require './lib/keygenerator'
require './lib/enigma'
require './lib/rotate'


class KeyGeneratorTest < Minitest::Test

  def setup
    @generate_key = KeyGenerator.new
    @enigma = Enigma.new
    @rotate = Rotate.new
  end

  def test_it_exists
    assert_instance_of Rotate, @rotate

  end

  def test_it_can_rotate_letters
    assert_equal 'k', @rotate.rotate_letters("h", 3)
  end

  def test_alphabet_contains_27_chars
    assert_equal 27, @rotate.alphabet.length
  end

  def test_it_can_rotate_words
    expected = 'keder ohulw!'
    assert_equal expected, @rotate.rotate_words('HeLlo World!', [3, 27, 73, 20])
  end
end
