require_relative 'string_calculator'
require 'rspec'

describe StringCalculator do 

  it 'returns 0 (Fixnum) when passed an empty string' do
    string = StringCalculator.new('')
    string.add.should eq (0)
  end

  it 'returns 1 (Fixnum) when passed the string "1"' do
    string = StringCalculator.new('1')
    string.add.should eq (1)
  end

  it 'returns 2 (Fixnum) when passed the string "2"' do
    string = StringCalculator.new('2')
    string.add.should eq (2)
  end

  it 'returns 3 (Fixnum) when passed the string "1,2"' do
    string = StringCalculator.new('1,2')
    string.add.should eq (3)
  end

  it 'returns 45 (Fixnum) when passed the string "41,4"' do
    string = StringCalculator.new('41,4')
    string.add.should eq (45)
  end

  it 'returns 4 (Fixnum) when passed the string "2\n2"' do
    string = StringCalculator.new("2\n2")
    string.add.should eq (4)
  end

  it 'returns 6 (Fixnum) when passed the string "1\n2,3"' do
    string = StringCalculator.new("1\n2,3")
    string.add.should eq (6)
  end

  it 'throws an error if passed multiple delimiters together' do
    expect { StringCalculator.new("1,\n2") }.to raise_error
  end

  describe 'a specified delimiter' do
    it 'is defined by //[delimeter]\n' do
      string = StringCalculator.new("//;\n1;2")
      string.add.should eq (3)
    end

    it 'can be any character' do
      string = StringCalculator.new("//?\n66?3")
      string.add.should eq (69)
    end
  end

  it 'does not allow negative numbers' do
    expect { StringCalculator.new('-3,3,-1') }.to raise_error(ArgumentError)
  end

  it 'returns error message with invlaid negative numbers' do 
    expect { StringCalculator.new('-5,3,2,-1,-6') }.to raise_error(ArgumentError, "Stop being so negative. Negative numbers were passed: -5, -1, -6.")
  end
  it 'skips numbers greater than 1000' do
    string = StringCalculator.new('1000,3')
    string.add.should eq (1003)
    string = StringCalculator.new('3,1001')
    string.add.should eq (3)
  end
end
