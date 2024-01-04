class Prisoner
  attr_reader :id
  
  def initialize(id, prisoner_count: 100, &warden)
    @id = id
    @visited = false
    @warden = warden
    @prisoner_count = prisoner_count
  end
  
  def prisoner_count
    @prisoner_count
  end

  def visit_room!(lamp:, day:)
    @visited = true
  end
  
  def visited?
    @visited
  end
  
  def proclaim_success!
    @warden.call
  end
  
  def value(day: nil)
    raise 'Not implemented!'
  end
  
  def lamp_value(lamp:, day:)
    lamp.on? ? 1 : 0
  end
end
