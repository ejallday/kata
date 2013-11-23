class StringCalculator
  MAX_NUMBER = 1000

  attr_reader :value
  
  def initialize(value)
    @value = value
    validate
  end
  
  def add
    digits.inject(0, :+)
  end

  private

  def validate
    if negatives.any?
      raise ArgumentError, "Stop being so negative. Negative numbers were passed: #{negatives.join(', ')}."
    elsif multiple_delimiters?
      raise ArgumentError, 'Multiple default delimiters not allowed together'
    end
  end

  def multiple_delimiters?
    true if value.match(/[,\n]{2,}/)
  end

  def negatives
    digits.select { |num| num < 0 }
  end

  def digits
    string_numbers.map(&:to_i).select {|num| less_than_max?(num) }
  end

  def delimiter
    if value.start_with?("//")
      value[2]
    else
      /,|\n/
    end
  end

  def less_than_max?(num)
    num <= MAX_NUMBER
  end

  def string_numbers
    value.split(delimiter)
  end
end
