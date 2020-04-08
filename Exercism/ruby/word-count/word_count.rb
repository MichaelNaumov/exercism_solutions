class Phrase
  def initialize(str)
    @str = str
  end

  def word_count
    dictionary = Hash.new(0)
    @str.scan(/[a-z\d]+(?:'[a-z\d]+)?/i).each do |word|
      dictionary[word.downcase] += 1
    end
    dictionary
  end
end

