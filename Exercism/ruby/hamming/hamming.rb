class Hamming
  def self.compute line_a, line_b
    return 0 if line_a.empty? || line_b.empty?

    raise ArgumentError if line_a.length != line_b.length
    (0...line_a.length).inject(0) { |res, i| line_a[i] != line_b[i] ? res + 1 : res }
  end
end
