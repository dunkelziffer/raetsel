class Treasury
  def initialize(player_ids)
    raise 'Player IDs not unique' unless player_ids.uniq.size == player_ids.size

    @token_ids = player_ids
    @chests = @token_ids.shuffle
    @found_token_ids = []
  end

  def open_chest!(chest_id, player_id:)
    token_id = @chests[chest_id - 1]
    @found_token_ids << token_id if token_id == player_id
    token_id
  end

  def chest_ids
    (1..@chests.size).to_a
  end

  def size
    @chests.size
  end

  def successful_player_ids
    @found_token_ids
  end
end
