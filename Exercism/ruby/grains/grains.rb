class Grains
  class << self
    def total
      calculate_amount(64 + 1) - 1
    end

    def square(n)
      raise ArgumentError if n <= 0 || n > 64

      calculate_amount(n)
    end

    def calculate_amount(n)
      return 1 if n == 1
      (2..n).inject { |prod, item| prod * 2 }
    end
  end
end
