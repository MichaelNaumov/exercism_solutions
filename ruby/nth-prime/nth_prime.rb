class Prime
  def self.nth(idx)
    if idx == 0
      raise ArgumentError
    end

    primes(idx)[idx]
  end

  def self.prime? n
    return false if n == 1
    (2..Math.sqrt(n).floor).each do |num|
      return true if num == n
      return false if n % num == 0
    end
    true
  end

  def self.primes(border)
    result = []
    number = 0
    while result.size <= border
      result << number if prime?(number)
      number += 1
    end
    result
  end
end
