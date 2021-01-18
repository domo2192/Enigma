require './test/test_helper'
require './lib/enigma'
require './lib/keygenerator'
require './lib/rotate'


class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_encrypt_is_hash_taking_three_arguements
    expected = {encryption: 'keder ohulw!',
                key: '02715',
                date: '040895'}
    assert_equal expected, @enigma.encrypt('Hello World!', '02715', '040895')
  end
end
