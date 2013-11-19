class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def ratio
    chainring / cog.to_f.round(2)
  end

  def gear_inches
    ratio * wheel.diameter.round(2)
  end

  def defaults
    { chainring: 40, cog: 18 }
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(args)
    @rim = args[:rim]
    @tire = args[:tire]
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference 
    diameter * Math::PI.round(2)
  end
end
