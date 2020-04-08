class Complement
  def self.of_dna(rna)
    return rna if rna.empty?

    rna.tr "GCTA", "CGAU"
  end
end
