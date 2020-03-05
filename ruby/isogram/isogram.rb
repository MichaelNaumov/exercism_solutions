class Isogram
  def self.isogram?(str)
    prepared_string = str.downcase.delete(" -").split("")
    return true if prepared_string == prepared_string.uniq
    false
  end
end
