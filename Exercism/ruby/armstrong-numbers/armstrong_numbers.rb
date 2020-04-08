class ArmstrongNumbers
  def self.include?(number)
    digits = number.to_s.split("").map(&:to_i)

    return true if number == digits.inject(0) { |sum, num| sum + num.pow(digits.length) }
    false
  end
end
