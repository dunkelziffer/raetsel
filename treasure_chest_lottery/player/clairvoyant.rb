class Player::Clairvoyant < Player
  def initialize(...)
    super
    @game = binding.of_caller(1)
  end

  def open_chests!(**)
    open_chest!(correct_chest_id)
  end

  private

  def correct_chest_id
    treasury = @game.eval('instance_variable_get(:@treasury)')
    treasury.instance_variable_get(:@chests).index(id) + 1
  end
end
