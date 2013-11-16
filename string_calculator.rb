class StringCalculator
  def add(value)
    nums = value.split(delimiter(value))
    validate(nums)
    nums.inject(0) do |memo, num|
      if num.to_i <= 1000
        memo + num.to_i
      else
        memo
      end
    end
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
