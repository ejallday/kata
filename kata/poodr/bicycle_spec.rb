require_relative 'bicycle'
require 'rspec'

describe Gear do
  it 'accepts and responds to 2 arguments, chainring and cog' do
    bike = Gear.new({chainring: 30, cog: 27})
    expect(bike.chainring).to eq(30)
    expect(bike.cog).to eq(27)
  end

  it 'returns the gear ratio 1.1111111111111112 when passed (30, 27)' do 
    bike = Gear.new({chainring: 30, cog: 27})
    expect(bike.ratio).to be_within(0.1).of(1.11)
  end

  it 'calculates gear inches' do
    wheel = Wheel.new({ rim: 26, tire: 1.5 })
    bike = Gear.new({chainring: 52, cog: 11, wheel:  wheel })
    expect(bike.gear_inches).to be_within(0.1).of(137.09)
  end
end

describe Wheel do 
  it 'returns the diameter of a wheel' do 
    wheel = Wheel.new({ rim: 26, tire: 1.5 })
    expect(wheel.diameter).to eq(29.0)
  end

  it 'returns the circumference of a wheel' do
    wheel = Wheel.new({ rim: 26, tire: 1.5 })
    expect(wheel.circumference).to eq(91.06)
  end
end
