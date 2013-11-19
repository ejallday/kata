require_relative 'string_calculator'
require 'rspec'

describe StringCalculator do 
  let(:calc) { StringCalculator.new }

  it 'returns 0 (Fixnum) when passed an empty string' do
    calc.add('').should eq(0)
  end

  it 'returns 1 (Fixnum) when passed the string "1"' do
    calc.add('1').should eq(1)
  end

  it 'returns 2 (Fixnum) when passed the string "2"' do
    calc.add('2').should eq(2)
  end

  it 'returns 3 (Fixnum) when passed the string "1,2"' do
    calc.add('1,2').should eq(3)
  end

  it 'returns 45 (Fixnum) when passed the string "41,4"' do
    calc.add('41,4').should eq(45)
  end

  it 'returns 4 (Fixnum) when passed the string "2\n2"' do
    calc.add("2\n2").should eq(4)
  end

  it 'returns 6 (Fixnum) when passed the string "1\n2,3"' do
    calc.add("1\n2,3").should eq(6)
  end

  it 'throws an error if passed multiple delimiters together' do
    expect { calc.add("1,\n2") }.to raise_error
  end

  describe 'a specified delimiter' do
    it 'is defined by //[delimeter]\n' do
      calc.add("//;\n1;2").should eq(3)
    end

    it 'can be any character' do
      calc.add("//?\n66?3").should eq(69)
    end
  end

  it 'does not allow negative numbers' do
    expect { calc.add('3,-1') }.to raise_error(ArgumentError)
  end

  it 'skips numbers greater than 1000' do
    expect(calc.add('1000,3')).to eq(1003)
    expect(calc.add('3,1001')).to eq(3)
  end
end
