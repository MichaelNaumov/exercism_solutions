class Luhn
  def self.valid?(str)
    return false if str.strip.length <= 1 || !str.match(/^[\d\s]+$/)

    oddity = str.length % 2 == 0 ? :even? : :odd?
    arr_of_ints = str.scan(/\d/).map(&:to_i)

    res = []
    arr_of_ints.each_with_index do |item, i|
      res << if i.send(oddity)
               item * 2 > 9 ? item * 2 - 9 : item * 2
             else
               item
             end
    end

    res.inject { |acc, i| acc + i } % 10 == 0 ? true : false
  end
end

