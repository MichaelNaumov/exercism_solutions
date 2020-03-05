class Pangram
  def self.pangram?(sentence)
    return true if (sentence.downcase.delete(" ").split("") & ("a".."z").to_a).size >= 26
    false
  end
end
