class StringCalculator
  def add(value)
    validate(value)
    prepare_value_array(value).inject(0) do |memo, num|
      if num.to_i <= 1000
        memo + num.to_i
      else
        memo
      end
    end
  end

  private

  
  def validate(value)
    if negative?(value)
      raise ArgumentError, "Stop being so negative. Negative numbers were passed: #{collect_negatives(value)}."
    elsif multiple_delimiters?(value)
      raise ArgumentError, 'Multiple default delimiters not allowed together'
    end
  end

  def negative?(value)
    true if value.match(/\-\d/) 
  end

  def multiple_delimiters?(value)
    true if value.match(/[,\n]{2,}/)
  end

  def collect_negatives(value)
    prepare_value_array(value).select { |num| num.to_i < 0 }.join(', ') 
  end

  def prepare_value_array(value)
    value.split(delimiter(value))
  end

  def delimiter(value)
    if value.start_with?("//")
      value[2]
    else
      /,|\n/
    end
  end
end
