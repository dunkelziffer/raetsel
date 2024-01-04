class Prisoner::UniverseHeatDeathSurvivor < Prisoner
  def initialize(...)
    super
    @counted_in_interval = 0
  end
  
  def visit_room!(lamp:, day:)
    super

    case day % prisoner_count
    when 1
      lamp.turn_on!
      @counted_in_interval = interval(day)
    when 2..(prisoner_count - 1)
      if interval(day) == @counted_in_interval
        lamp.turn_off!
      else
        @counted_in_interval = interval(day)
      end
    when 0
      if interval(day) == @counted_in_interval
        lamp.turn_off!
      elsif lamp.on?
        @counted_in_interval = interval(day)
        proclaim_success!
      end
    else
      raise 'error'
    end
  end
  
  def interval(day)
    ((day - 1) / prisoner_count) + 1
  end
  
  def value(lamp:, day:)
    interval(day) == @counted_in_interval && lamp.on? ? 0 : 1
  end
  
  def lamp_value(lamp:, day:)
    if lamp.on?
      temp = day % prisoner_count
      temp == 0 ? prisoner_count : temp
    else
      0
    end
  end
end

