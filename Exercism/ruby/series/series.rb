class Series
  def initialize(input)
    @input = input
  end

  def slices(partition)
    raise ArgumentError if partition > @input.length
    res = []

    (0..@input.length).each { |n| res << @input[n, partition] if @input[n, partition].size == partition }

    res
  end
end

