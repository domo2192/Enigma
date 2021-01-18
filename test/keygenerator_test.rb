require './test/test_helper'
require './lib/keygenerator'
require './lib/enigma'


class KeyGeneratorTest < Minitest::Test

  def setup
    @generate_key = KeyGenerator.new
    @enigma = Enigma.new
  end

  def test_it_exits
    assert_instance_of KeyGenerator, @generate_key
  end

  def test_alphabet_contains_27_chars
    assert_equal 27, @generate_key.alphabet.length
  end

  def test_dates_can_be_converted
    Date.stubs(:today).returns("011521")
    assert_equal "011521", @generate_key.convert_date
  end

  def test_keys_can_be_generated
    numbers = (0..9).to_a
      @generate_key.key_numbers.split("").each do |number|
    assert_includes numbers, number.to_i
    end

  end

  def test_split_digits_to_key
    assert_equal [02 , 27, 71, 15], @generate_key.split_keys('02715')
  end

  # def test_encrypt_is_hash_taking_three_arguements
  #   cipher = mock
  #   key = mock
  #   date = mock
  #   expected = {encryption: cipher,
  #               key: key,
  #               date: date}
  #   assert_equal expected, generate_key.encrypt('akjakj jfj')
  # end

  def test_offsets
    assert_equal [1, 0 , 2 , 5], @generate_key.create_offsets('040895')
  end

  def create_values
    assert_equal [3, 27, 73, 20], @generate_key.create_values('02715', '040895')

  end

  def test_merge_offsets_and_split_keys
    expected = {A: 3,
                B: 27,
                C: 73,
                D: 20}
    assert_equal expected, @generate_key.final_shifts([3, 27, 73, 20])

  end

end
