class Player::Modulator < Player

  def bet
    (total_sum_bet - observe_others.values.sum) % hat_types.size
  end

  private

  def total_sum_bet
    id
  end

end
