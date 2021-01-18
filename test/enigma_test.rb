require './test/test_helper'
require './lib/enigma'
require './lib/keygenerator'


class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end
