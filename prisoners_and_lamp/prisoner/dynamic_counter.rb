class Prisoner::DynamicCounter < Prisoner
  def initialize(...)
    super
    @counted = false
    @count = 0
    @role = :regular
  end
  
  def visit_room!(lamp:, day:)
    super
    
    case day
    when 1
      lamp.turn_on!
      @counted = true
    when 2..prisoner_count
      if lamp.on?
        if @counted
          lamp.turn_off!
          @role = :counter
          @count = day -2
        else
          @counted = true
        end
      end
    else
      case @role
      when :counter
        if lamp.on?
          lamp.turn_off!
          @count += 1
        end
        
        proclaim_success! if @count == prisoner_count - 1
      when :regular
        if !@counted && lamp.off?
          lamp.turn_on!
          @counted = true
        end
      end
    end
  end
  
  def value(lamp:, day:)
    case @role
    when :regular
      @counted ? 0 : 1
    when :counter
      @count + 1
    end
  end
  
  def lamp_value(lamp:, day:)
    if lamp.on?
      day <= prisoner_count ? day : 1
    else
      0
    end
  end
end

