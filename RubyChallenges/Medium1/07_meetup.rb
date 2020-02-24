=begin
initialize creates date object with year and month

day method returns Date object matching parameters
day(symbol_for_day_of_week, symbol_for_day_of_month )

day_of_week
:monday, etc.

days of month
:first, :second, :third, :fourth => correspond to xth occurance of day that month
:last is last occurance of that month (how to determine?)
:teenth is 13 through 19, one of these will each fall on diff weekday

we can check any given day to see if mon, tue, etc.
We can increment a date object
naive approach, create a date object for every day of the month
and return first date object that fits criteria

weekdays can be check for with existing functions
determing first, second, third, fourth, last
and teenth occurance of month nontrivial

create date object for first day of month
check to see if day of week matches parameter
  if yes, move to checking for day_of_month
  else increment day

ith of weekday is now equal to 1
check to see if day of month matches criteria (same month, day)
if yes, return date object
else increment 7 days
=end

class Meetup
  def initialize(month, year)
    @date = Date.new(year, month)
  end

  def day(weekday, schedule)
    meeting_day = @date
    
    # create method to test for first x-day
    test_day = (weekday.to_s + '?').to_sym
    
    # find first x-day of month
    loop do
      if meeting_day.method(test_day).call
        break
      else
        meeting_day = meeting_day.next
      end
    end
    
    possible_dates = []
    loop do
      possible_dates << meeting_day
      meeting_day = meeting_day + 7
      break if meeting_day.month != @date.month
    end
    
    
    meeting_day = case schedule
    when :first then possible_dates[0]
    when :second then possible_dates[1]
    when :third then possible_dates[2]
    when :fourth then possible_dates[3]
    when :last then possible_dates[-1]
    when :teenth 
      possible_dates.select { |choice| (13..19).include?(choice.day) }.first
    end

    meeting_day
  end
end