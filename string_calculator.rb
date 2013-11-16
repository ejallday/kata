class StringCalculator
  def add(value)
    nums = value.split(delimiter(value))
    nums.inject(0) { |sum, n| sum + n.to_i }
  end

  private

  def delimiter(value)
    if value.start_with?("//")
      value[2]
    else
      /,|\n/
    end
  end
end
