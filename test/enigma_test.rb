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

  def test_generate_key_stubs
    @enigma.stubs(:rand).returns(2715)
    @enigma.stubs(:key_numbers).returns(2715)
    assert_equal 2715, @enigma.key_numbers
  end

  def test_dates_can_be_converted
    Date.stubs(:today).returns(Date.new(2021, 1, 15))
    assert_equal '011521', @enigma.convert_date
  end

  def test_encrypt_is_hash_taking_three_arguements
    expected = { encryption: 'keder ohulw!',
                 key: '02715',
                 date: '040895' }
    assert_equal expected, @enigma.encrypt('hello world!', '02715', '04/08/95')
  end

  def test_todays_date
    @enigma.stubs(:convert_date).returns('040895')
    expected = { encryption: 'keder ohulw!',
                 key: '02715',
                 date: '040895' }
    assert_equal expected, @enigma.encrypt('hello world!', '02715')
  end

  def test_default_keys_date
    @enigma.stubs(:rand).returns(2715)
    @enigma.stubs(:key_numbers).returns('02715')
    @enigma.stubs(:convert_date).returns('040895')
    expected = { encryption: 'keder ohulw!',
                 key: '02715',
                 date: '040895' }

    assert_equal expected, @enigma.encrypt('hello world!')
  end

  def test_decrypt
    expected = { decryption: 'hello world!',
                 key: '02715',
                 date: '040895' }
    assert_equal expected, @enigma.decrypt('keder ohulw!', '02715', '040895')
  end
end
