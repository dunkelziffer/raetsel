class Game
  class NoMoreAttempts < StandardError; end

  def initialize(player_tally)
    sequence = Sequence.new
    @players = []
    player_tally.each do |player_type, count|
      count.times { @players << player_type.new(sequence.get_id, &method(:open_chest!)) }
    end

    @treasury = Treasury.new(@players.map(&:id))
    @remaining_attempts_for_current_player = 0
  end

  def run
    @players.each_with_index do |player, index|
      begin
        @remaining_attempts_for_current_player = @treasury.size / 2
        player.open_chests!(chest_ids: @treasury.chest_ids.dup)
      rescue NoMoreAttempts
        # no-op
      end

      if player_lost?(player)
        Logger.verbose(:puts, '')
        return Result.new(success: false, successful_players: index)
      end

      Logger.verbose(:print, Rainbow('.').green)
    end

    Logger.verbose(:puts, '')
    Result.new(success: true, successful_players: @players.size)
  end

  def open_chest!(...)
    raise NoMoreAttempts unless @remaining_attempts_for_current_player.positive?

    @remaining_attempts_for_current_player -= 1
    @treasury.open_chest!(...)
  end

  private

  def player_lost?(player)
    !@treasury.successful_player_ids.include?(player.id)
  end
end
