class StringCalculator
  attr_reader :value
  
  def initialize(value)
    @value = value
    validate
  end
  
  def add
    prepare_value_array.inject(0) do |memo, num|
      if num.to_i <= 1000
        memo + num.to_i
      else
        memo
      end
    end
  end

  private

  
  def validate
    if negative?
      raise ArgumentError, "Stop being so negative. Negative numbers were passed: #{collect_negatives}."
    elsif multiple_delimiters?
      raise ArgumentError, 'Multiple default delimiters not allowed together'
    end
  end

  def negative?
    true if value.match(/\-\d/) 
  end

  def multiple_delimiters?
    true if value.match(/[,\n]{2,}/)
  end

  def collect_negatives
    prepare_value_array.select { |num| num.to_i < 0 }.join(', ') 
  end

  def prepare_value_array
    value.split(delimiter)
  end

  def delimiter
    if value.start_with?("//")
      value[2]
    else
      /,|\n/
    end
  end
end
