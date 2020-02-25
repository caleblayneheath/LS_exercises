class Clock

  attr_reader :time
  
  def initialize(minutes)
    @time = parse_minutes(minutes)
  end

  def parse_minutes(minutes)
    minutes % 1440
  end

  # this should return a new clock instance
  def self.at(hour, minutes = 0)
    Clock.new((hour * 60) + minutes)
  end

  # turns integer of minutes to HH:MM 24 string
  def to_s
    hour, minute = time.divmod(60)
    hour = 0 if hour == 24
    format('%02d:%02d', hour, minute)
  end

  def +(minutes)
    @time = parse_minutes(time + minutes)
  end

  def -(minutes)
    @time = parse_minutes(time - minutes)
  end

  def <=>(other_clock)
    time <=> other_clock.time
  end
end