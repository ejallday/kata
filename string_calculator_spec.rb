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
end
