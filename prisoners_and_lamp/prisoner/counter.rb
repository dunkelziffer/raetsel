class Prisoner::Counter < Prisoner
  def initialize(...)
    super
    @count = 0
  end
  
  def visit_room!(lamp:, day:)
    super
    
    if lamp.on?
      lamp.turn_off!
      @count += 1
    end
    
    proclaim_success! if @count == prisoner_count - 1
  end
  
  def value(lamp:, day:)
    @count + 1
  end
end

