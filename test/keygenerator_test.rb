require './test/test_helper'
require './lib/keygenerator'
require './lib/enigma'

class KeyGeneratorTest < Minitest::Test
  def setup
    @generate_key = KeyGenerator.new
    @enigma = Enigma.new
  end

  def test_it_exits
    assert_instance_of Enigma, @enigma
    assert_instance_of KeyGenerator, @generate_key
  end

  def test_alphabet_contains_27_chars
    assert_instance_of Array, ('a'..'z').to_a
    assert_equal 27, @generate_key.alphabet.length
  end

  def test_split_digits_to_key
    assert_equal [0o2, 27, 71, 15], @generate_key.split_keys('02715')
  end

  def test_offsets
    assert_equal [1, 0, 2, 5], @generate_key.create_offsets('040895')
  end

  def test_create_values
    @generate_key.stubs(:split_keys).returns([2, 27, 71, 15])
    @generate_key.stubs(:create_offsets).returns([1, 0, 2, 5])
    assert_equal [3, 27, 73, 20], @generate_key.create_values('02715', '040895')
  end

  def test_merge_offsets_and_split_keys
    expected = { A: 3,
                 B: 27,
                 C: 73,
                 D: 20 }
    assert_equal expected, @generate_key.final_shifts([3, 27, 73, 20])
  end
end
