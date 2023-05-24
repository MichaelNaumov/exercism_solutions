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

    result = input.scan(/\d+\D|\D/).map do |num_letter|
      num,letter = if num_letter.length == 1
        [1, num_letter]
      else
        num_letter.scan(/\d+|\D/)
      end
      Array.new(num.to_i, letter).join
    end

    result.join
  end
end
