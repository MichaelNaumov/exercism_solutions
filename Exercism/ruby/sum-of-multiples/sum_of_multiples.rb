class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(max)
    return 0 if @factors.delete(0)
    sum = 0
    multiples = []
    @factors.each do |factor|
      (factor...max).each do |step|
        multiples << step if step % factor == 0
      end
    end 
    multiples.uniq.sum
  end
end
