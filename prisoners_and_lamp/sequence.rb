class Sequence
  def initialize
    @last_id = 0
  end
  
  def get_id
    @last_id += 1
  end
end
