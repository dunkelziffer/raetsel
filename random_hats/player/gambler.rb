class Player::Gambler < Player

  def bet
    hat_types.sample
  end

end
