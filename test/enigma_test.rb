require './test/test_helper'
require './lib/enigma'


class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_alphabet_contains_27_chars
    assert_equal 27, @enigma.alphabet.length
  end

  def test_dates_can_be_converted
    assert_equal "011421", @enigma.convert_date
  end

  def test_keys_can_be_generated
    numbers = (0..9).to_a
      @enigma.key_numbers.split("").each do |number|
    assert_includes numbers, number.to_i
    end

  end

  def test_split_digits_to_key
    assert_equal [02 , 27, 71, 15], @enigma.split_keys('02715')
  end

  def test_encrypt_is_hash_taking_three_arguements
    cipher = mock
    key = mock
    date = mock
    expected = {encryption: cipher,
                key: key,
                date: date}
    assert_equal expected, @enigma.encrypt('akjakj jfj')
  end

  def test_offsets
    assert_equal [1, 0 , 2 , 5], @enigma.create_offsets('040895')
  end

  def test_merge_offsets_and_split_keys
    assert_equal 

  end
end
