class Player::Clairvoyant < Player

  def initialize(...)
    super
    @game = binding.of_caller(1)
  end

  def bet
    correct_hat_id
  end

  private

  def correct_hat_id
    hat_assignment = @game.eval('instance_variable_get(:@hat_assignment)')
    hat_assignment[id]
  end

end
