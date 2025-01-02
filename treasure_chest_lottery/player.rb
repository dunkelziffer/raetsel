class Player
  attr_reader :id

  def initialize(id, &open_chest)
    @id = id
    @open_chest = open_chest
  end

  def open_chests!(chest_ids:)
    raise 'Not implemented!'
  end

  def open_chest!(chest_id)
    @open_chest.call(chest_id, player_id: @id)
  end
end
