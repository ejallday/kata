class StringCalculator
  def add(value)
    nums = value.split(delimiter(value))
    validate(nums)
    nums.inject(0) { |sum, n| sum + n.to_i }
  end

  private

  def validate(nums)
    if nums.any? { |n| n.to_i < 0 }
      raise ArgumentError, 'Stop being so negative'
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
