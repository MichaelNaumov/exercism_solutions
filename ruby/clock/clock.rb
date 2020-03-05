class Clock
  attr_accessor :hours, :minutes

  def initialize(time)
    @hours  = time[:hour] || 0
    @minutes = time[:minute] || 0
  end

  def formatted_time
    @hours += @minutes / 60

    {
      hours: (@hours % 24).to_s,
      minutes: (@minutes % 60).to_s
    }
  end

  def to_s
    formatted_time[:hours].rjust(2,"0") + ":" + formatted_time[:minutes].rjust(2,"0")
  end

  def +(clock)
    Clock.new(hour: self.hours + clock.hours, minute: self.minutes + clock.minutes)
  end

  def -(clock)
    Clock.new(hour: self.hours - clock.hours, minute: self.minutes - clock.minutes)
  end

  def ==(clock)
    return true if self.hours == clock.hours && self.minutes == clock.minutes
    return true if clock.to_s == self.to_s
    false
  end
end
