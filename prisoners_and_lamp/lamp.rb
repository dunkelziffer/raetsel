class Lamp

  def initialize
    @on = false
  end
  
  def on?
    @on
  end
  
  def off?
    !on?
  end
  
  def turn_on!
    @on = true
  end
  
  def turn_off!
    @on = false
  end

end
