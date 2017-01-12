class Meetup
  WEEKDAYS = { sunday: 0,
               monday: 1,
               tuesday: 2,
               wednesday: 3,
               thursday: 4,
               friday: 5,
               saturday: 6 }

  def initialize(month, year)
    @month = month
    @year = year
    @schedule_start_day = {
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      last: -7,
      teenth: 13
    }
  end

  def day(weekday, schedule)
    start_date = Date.new(@year, @month, @schedule_start_day[schedule])
    7.times do |i|
      return (start_date + i) if (start_date + i).wday == WEEKDAYS[weekday]
    end
  end
end
