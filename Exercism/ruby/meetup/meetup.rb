require 'date'

class Meetup
  def initialize month, year
    @month = month
    @year = year
  end
  
  def day weekday, descriptor
    method = (weekday.to_s + "?").to_sym
    
    case descriptor
    when :first
      find_date 1, 0, method
    when :second
      find_date 2, 1, method
    when :third
      find_date 3, 2, method
    when :fourth
      find_date 4, 3, method
    when :last
      end_date = Date.new(@year, @month, -1)
      start_date = end_date - 6
      (start_date..end_date).select { |day| day.send(method) }.last
    when :teenth
      start_date = Date.new(@year, @month, 13)
      end_date = start_date + 6
      (start_date..end_date).select { |day| day.send(method) }.first
    end
  end

  private

  def find_date index, order, method
    start_date = Date.new(@year, @month)
    end_date = start_date + 7 * index - 1
    (start_date..end_date).select { |day| day.send(method) }[order]
  end
end
