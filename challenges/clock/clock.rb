class Clock
  HOURS = 24
  MINUTES = 60

  class << self
    def at(hours, minutes = 0)
      new(hours, minutes)
    end
  end

  def initialize(hours, minutes = 0)
    @hours = hours % HOURS + minutes / MINUTES
    @minutes = minutes % MINUTES
  end

  def to_s
    @hours.to_s.rjust(2, '0') + ':' + @minutes.to_s.rjust(2, '0')
  end

  def +(min)
    @minutes += min
    wrap!
    self
  end

  def -(min)
    @minutes -= min
    wrap!
    self
  end

  def ==(other)
    self.to_s == other.to_s
  end

  private

  def wrap!
    wrap_minutes!
    wrap_hours!
  end

  def wrap_minutes!
    if @minutes < 0
      @hours -= (@minutes.abs / MINUTES) + 1
      @minutes = MINUTES - (@minutes.abs % MINUTES)
    elsif @minutes >= MINUTES
      @hours = @hours + (@minutes / MINUTES)
      @minutes %= MINUTES
    end
  end

  def wrap_hours!
    if @hours < 0
      @hours = HOURS - (@hours.abs % HOURS)
    elsif @hours >= HOURS
      @hours %= HOURS
    end
  end
end
