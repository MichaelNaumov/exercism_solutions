module Roman
  ROMANS = {
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    6 => "VI",
    7 => "VII",
    8 => "VIII",
    9 => "IX",
    10 => "X"
  }


  def to_roman
    decimal = self

    decimal.to_s.split("").map { |d| ROMANS[d.to_i] }.join
  end
end

class Integer
  include Roman
end


p 1.to_roman
