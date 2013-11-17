class RomanNumeralConverter
  attr_reader :num

  BIGGEST_POSSIBLE_NUMBER = 899

  GLYPH_MAP = {
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I',
  }

  def initialize(num)
    raise ArgumentError, "Please enter a number between 1 and #{BIGGEST_POSSIBLE_NUMBER}" if valid_number?(num)
    @num = num
  end

  def to_roman_numeral
    numeral = ''
    GLYPH_MAP.each do |number, glyph|
      while num >= number
        numeral << glyph
        @num -= number
      end
    end
    numeral
  end

  private

  def valid_number?(number)
    (number < 1 || number > BIGGEST_POSSIBLE_NUMBER)
  end
end
