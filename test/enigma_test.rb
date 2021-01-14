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
end
