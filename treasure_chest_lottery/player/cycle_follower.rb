class Player::CycleFollower < Player
  def open_chests!(**)
    next_chest_id = id

    loop do
      break if id == (token_id = open_chest!(next_chest_id))
      next_chest_id = token_id
    end
  end
end
