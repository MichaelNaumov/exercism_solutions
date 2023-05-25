class IsbnVerifier
  def self.valid?(string)
    digits = prepare_string(string).reverse
    sum = 0
    if digits.length == 10
      (10).downto(1).each do |coef|
        sum += coef * digits[coef - 1]
      end

      sum % 11 == 0
    else
      false
    end
  end

  def self.prepare_string(string)
    digits_letters = string.scan(/[0-9]|[A-Z]/)
    digits = string.scan(/[0-9]|X/)
    return [] if digits.length != digits_letters.length
    digits[digits.length - 1] = "10" if digits.last == "X"
    digits.map!(&:to_i)
  end
end
