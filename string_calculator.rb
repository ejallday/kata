class StringCalculator
  def add(value)
    nums = value.split(',')
    nums.inject(0) { |sum, n| sum + n.to_i }
  end
end
