class Game

  def initialize(player_tally)
    player_count = player_tally.values.sum
    @hat_types = (0...player_count).to_a.freeze

    sequence = Sequence.new
    @players = []
    player_tally.map do |player_type, count|
      count.times do
        id = sequence.get_id
        @players << player_type.new(id, @hat_types, &-> { observe_others(except: id) })
      end
    end

    @hat_assignment = @players.to_h do |player|
      [player.id, @hat_types.sample]
    end.freeze

    @bets = {}
  end

  def run
    @players.each do |player|
      @bets[player.id] = player.bet
    end

    @correct_guesses = 0
    @players.each do |player|
      if @bets[player.id] == @hat_assignment[player.id]
        Logger.verbose(:print, Rainbow('✓').green)
        @correct_guesses += 1
      else
        Logger.verbose(:print, '.')
      end
    end
    success = @correct_guesses >= 1

    Logger.verbose(:puts, '')
    Result.new(success:, successful_players: @correct_guesses)
  end

  private

  def observe_others(except:)
    @hat_assignment.except(except)
  end

end
