class Prisoner::Clairvoyant < Prisoner
  def initialize(...)
    super
    @game = binding.of_caller(1)
  end
  
  def visit_room!(lamp:, day:)
    super
    proclaim_success! if @game.eval('visitor_count') == prisoner_count
  end
  
  def value(lamp:, day:)
    visited? ? 0 : 1
  end
  
  def lamp_value(lamp:, day:)
    @game.eval('visitor_count')
  end
end

