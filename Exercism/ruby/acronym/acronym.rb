class Acronym
  def self.abbreviate(input)
    input.split(/\W+/).map { |w| w[0].capitalize }.join
  end
end
