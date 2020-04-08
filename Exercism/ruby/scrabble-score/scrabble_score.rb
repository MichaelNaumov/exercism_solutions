class Scrabble
  COSTS = { "AEIOULNRST" => 1, "DG" => 2, "BCMP" => 3, "FHVWY" => 4, "K" => 5, "JX" => 8, "QZ" => 10 }

  def initialize(word)
    @word = word
  end

  def score
    self.class.score(@word)
  end

  def self.score(word)
    return 0 unless word

    @pre_word = word.scan(/\w/)

    res = 0
    @pre_word.each do |c|
      COSTS.each_pair do |k,v|
        res += v if k.include?(c.upcase)
      end
    end
    res
  end
end
