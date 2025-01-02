class Player::Gambler < Player
  def open_chests!(chest_ids:)
    chest_ids.shuffle!

    loop do
      break if id == (token_id = open_chest!(chest_ids.pop))
    end
  end
end
