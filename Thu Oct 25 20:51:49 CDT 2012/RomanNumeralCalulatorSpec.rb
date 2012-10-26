require 'minitest/autorun'

class TestRomanNumeralCalculatorSpec < MiniTest::Unit::TestCase
  def test_roman_numeral_calculator
    @rnc = RomanCalculator.new
    assert_equal "I", @rnc.calculate(1)
    assert_equal "II", @rnc.calculate(2)
    assert_equal "V", @rnc.calculate(5)
    assert_equal "VI", @rnc.calculate(6)
    assert_equal "X", @rnc.calculate(10)
    assert_equal "XI", @rnc.calculate(11)
    assert_equal "IV", @rnc.calculate(4)
    assert_equal "IX", @rnc.calculate(9)
    assert_equal "CCC", @rnc.calculate(300)
    assert_equal "MCDXXXII", @rnc.calculate(1432)
    assert_equal "CMXIII", @rnc.calculate(913)
    assert_equal "CMXCIX", @rnc.calculate(999)
  end
end

class RomanCalculator
  def lookup_hash
    {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC", 50 => "L", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}
  end
  def calculate(integer)
    return_value = ""
    lookup_hash.each do |key, value| 
      while integer >= key
        return_value << value
        integer -= key
      end
    end
    return_value 
  end
end
