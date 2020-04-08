class TwelveDays
  NUMBERS = { 1 => "second",
              2 => "third",
              3 => "fourth",
              4 => "fifth",
              5 => "sixth",
              6 => "seventh",
              7 => "eighth",
              8 => "ninth",
              9 => "tenth",
              10 => "eleventh",
              11 => "twelfth" }

  FIRST_LINE = "On the first day of Christmas my true love gave to me: "

  GIFTS = ["and a Partridge in a Pear Tree",
           "two Turtle Doves",
           "three French Hens",
           "four Calling Birds",
           "five Gold Rings",
           "six Geese-a-Laying",
           "seven Swans-a-Swimming",
           "eight Maids-a-Milking",
           "nine Ladies Dancing",
           "ten Lords-a-Leaping",
           "eleven Pipers Piping",
           "twelve Drummers Drumming"]

  def self.song
    song = FIRST_LINE << "a Partridge in a Pear Tree.\n\n"
    (1..11).each do |i|
      song << "On the #{NUMBERS[i]} day of Christmas my true love gave to me: "
      song << add_lines(i)
    end
    song.chomp
  end

  def self.add_lines(number)
    lines = GIFTS.take(number + 1).reverse.join(", ")
    lines << ".\n\n"
  end
end

