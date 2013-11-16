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
end
