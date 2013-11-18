class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(options = {}, wheel=nil)
    @chainring = options[:chainring] || 0
    @cog = options[:cog] || 0 
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f.round(2)
  end

  def gear_inches
    ratio * wheel.diameter.round(2)
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference 
    diameter * Math::PI.round(2)
  end
end
