class RunLengthEncoding
  def self.encode(input)
    return "" if input == ""

    result = input.scan(/((.)\2*)/).map do |set|
      res = ""
      res = set.first.length.to_s if set.first.length > 1
      res += set.last
    end

    result.join
  end

  def self.decode(input)
    return "" if input == ""

    result = input.scan(/\d+|\D+/).each_slice(2).map do |num, letter|
      res = ""
      res << Array.new(num.to_i, letter).join
      res
    end

    result.join
  end
end

p RunLengthEncoding.decode('12X3Y4Z')
