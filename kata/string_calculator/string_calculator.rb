class StringCalculator
  def add(value)
    validate(value)
    nums = value.split(delimiter(value))
    nums.inject(0) do |memo, num|
      if num.to_i <= 1000
        memo + num.to_i
      else
        memo
      end
    end
  end

  private

  def validate(value)
    if value.match(/\-\d/)
      raise ArgumentError, 'Stop being so negative'
    elsif value.match(/[,\n]{2,}/)
      raise ArgumentError, 'Multiple default delimiters not allowed together'
    end
  end

  def delimiter(value)
    if value.start_with?("//")
      value[2]
    else
      /,|\n/
    end
  end
end
