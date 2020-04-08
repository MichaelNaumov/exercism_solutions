class Sieve
  def initialize(size)
    @size = size
  end

  def primes
    result = all_numbers = (2..@size).to_a

    all_numbers.each do |n|
      result = result.reject do |num|
        num if num != n && num % n ==0
      end
    end
    result
  end
end
