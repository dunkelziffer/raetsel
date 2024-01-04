module Prisoner::Utils::Intervals

  def interval_type(day)
    shifted = day_of_interval(day)
    
    intervals.find do |days, _type|
      result = shifted < days
      shifted -= days
      result
    end.last
  end
  
  def last_day_of_interval?(day)
    interval_type(day) != interval_type(day + 1)
  end
  
  def day_of_interval(day)
    (day - 1 - interval_offset) % interval_length
  end
  
  def interval_length
    intervals.sum(&:first)
  end

  def interval_offset
    0
  end

  def intervals
    raise 'Not implemented!'
  end

end
