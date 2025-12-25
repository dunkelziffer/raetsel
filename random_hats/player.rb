class Player
  attr_reader :id, :hat_types

  def initialize(id, hat_types, &observe_others)
    @id = id
    @hat_types = hat_types
    @observe_others = observe_others
  end

  def bet
    raise 'Not implemented!'
  end

  def observe_others
    @observe_others.call
  end
end
