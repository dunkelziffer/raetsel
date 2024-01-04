class Prisoner::Regular < Prisoner
  def initialize(...)
    super
    @counted = false
  end
  
  def visit_room!(lamp:, day:)
    super
    
    if !@counted && lamp.off?
      lamp.turn_on!
      @counted = true
    end
  end
  
  def value(lamp:, day:)
    @counted ? 0 : 1
  end
end

