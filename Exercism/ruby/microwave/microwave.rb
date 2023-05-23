class Microwave
  def initialize(seconds)
    @seconds = seconds
  end

  def timer
    if @seconds < 60
      seconds = @seconds
      minutes = 0
    elsif @seconds < 100
      minutes = @seconds / 60
      seconds = @seconds - 60 * minutes
    else
      seconds = @seconds.to_s[-2..-1]
      minutes = if seconds.to_i > 60
        seconds = seconds.to_i - 60
        @seconds.to_s[0..-3].to_i + 1
      else
        @seconds.to_s[0..-3]
      end
    end

    "#{sprintf('%02d', minutes)}:#{sprintf('%02d', seconds)}"
  end
end
