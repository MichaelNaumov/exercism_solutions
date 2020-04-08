class Matrix
  def initialize(arr_str)
    @arr = arr_str.split("\n").map { |row| row.split.map(&:to_i) }
  end

  def rows
    @arr
  end

  def columns
    @arr.transpose
  end
end
