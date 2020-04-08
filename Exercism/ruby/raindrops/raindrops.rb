class Raindrops
  def self.convert(number)
    delimeters = [3, 5, 7]

    converted_string = delimeters.inject("") do |result, del|
      result << if number % del == 0
                  case del
                  when 3
                    "Pling"
                  when 5
                    "Plang"
                  when 7
                    "Plong"
                  end
                else
                  ""
                end
    end

    converted_string.empty? ? number.to_s : converted_string
  end
end
