class StringCalculator
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def add
    value.to_i
  end
end
