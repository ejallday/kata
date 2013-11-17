require_relative 'roman_numerals'
require 'rspec'

describe 'RomanNumeralConverter' do 
  it 'returns "I" when given 1 (Fixnum)' do
    converter = RomanNumeralConverter.new(1)
    expect(converter.to_roman_numeral).to eq('I')
  end

  it 'returns "II" when given 2 (Fixnum)' do
    converter = RomanNumeralConverter.new(2)
    expect(converter.to_roman_numeral).to eq('II')
  end

  it 'returns "IV" when given 4 (Fixnum)' do
    converter = RomanNumeralConverter.new(4)
    expect(converter.to_roman_numeral).to eq('IV')
  end

  it 'returns "V" when given 5 (Fixnum)' do 
    converter = RomanNumeralConverter.new(5)
    expect(converter.to_roman_numeral).to eq('V')
  end

  it 'returns "VI" when given 6 (Fixnum)' do 
    converter = RomanNumeralConverter.new(6)
    expect(converter.to_roman_numeral).to eq('VI')
  end

  it 'returns "XIV" when given 14 (Fixnum)' do 
    converter = RomanNumeralConverter.new(14)
    expect(converter.to_roman_numeral).to eq('XIV')
  end

  it 'returns "XIX" when given 19 (Fixnum)' do 
    converter = RomanNumeralConverter.new(19)
    expect(converter.to_roman_numeral).to eq('XIX')
  end

  it 'returns "X" when given 10 (Fixnum)' do 
    converter = RomanNumeralConverter.new(10)
    expect(converter.to_roman_numeral).to eq('X')
  end

  it 'returns "L" when given 50 (Fixnum)' do 
    converter = RomanNumeralConverter.new(50)
    expect(converter.to_roman_numeral).to eq('L')
  end

  it 'returns "C" when given 100 (Fixnum)' do 
    converter = RomanNumeralConverter.new(100)
    expect(converter.to_roman_numeral).to eq('C')
  end

  it 'returns "IX" when given 9 (Fixnum)' do 
    converter = RomanNumeralConverter.new(9)
    expect(converter.to_roman_numeral).to eq('IX')
  end

  it 'returns "XCIX" when given 99 (Fixnum)' do 
    converter = RomanNumeralConverter.new(99)
    expect(converter.to_roman_numeral).to eq('XCIX')
  end

  it 'returns "CD" when given 400 (Fixnum)' do 
    converter = RomanNumeralConverter.new(400)
    expect(converter.to_roman_numeral).to eq('CD')
  end

  it "raises an error if it can't handle the passed number" do
    expect {RomanNumeralConverter.new(0)}.to raise_error(ArgumentError)
    expect {RomanNumeralConverter.new(900)}.to raise_error(ArgumentError)
  end
end
