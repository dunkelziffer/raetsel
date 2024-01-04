module Prisoner::Utils::Actions

  def aggregating?(level:)
    @aggregates[level] > 0
  end

  def give!(lamp:, level:)
    if lamp.off? && @counts[level] > 0
      lamp.turn_on!
      @counts[level] -= 1
    end
  end
  
  def take!(lamp:, level:)
    if lamp.on?
      lamp.turn_off!
      @counts[level] += 1
      
      aggregate!
      
      proclaim_success! if @counts.last == 1
    end
  end
  
  def aggregate!
    @factors.each_with_index do |factor, level|
      if @aggregates[level] > 0 && @counts[level] >= factor
        @counts[level] -= factor
        @counts[level + 1] += 1
        @aggregates[level] -= 1
      end
    end
  end
  
  def remember!(lamp:, level:)
    if lamp.on?
      lamp.turn_off!
      @counts[level] += 1
    end
  end

end
