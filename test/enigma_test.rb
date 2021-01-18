require './test/test_helper'
require './lib/enigma'
require './lib/keygenerator'
require './lib/rotate'


class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
    @key_generator = KeyGenerator.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
    assert_instance_of KeyGenerator, @key_generator
  end

  def test_encrypt_is_hash_taking_three_arguements
    expected = {encryption: 'keder ohulw!',
                key: '02715',
                date: '040895'}
    assert_equal expected, @enigma.encrypt('Hello World!', '02715', '04/08/95')
  end

  def test_default_date
    expected = {encryption: "pefaw qdzly!",
                key: '02715',
                date: '011821'}
  assert_equal expected, @enigma.encrypt('Hello World!', '02715')
  end

  def test_default_keys
    @key_generator = mock
    @key_generator.stubs(:key_numbers).returns('02715')
    @key_generator.stubs(:convert_date).returns('011821')
    expected = {encryption: "pefaw qdzly!",
                key: '02715',
                date: '011821'}

    assert_equal expected, @enigma.encrypt('Hello World!')
  end

  def test_decrypt
    expected = {decryption: 'hello world!',
                key: '02715',
                date: '040895'}
  assert_equal expected, @enigma.decrypt('keder ohulw!', '02715','040895' )
  end
end
