class Strategies

  STRATEGIES = {
    xxs_random: {
      Player::Gambler => 2,
    },
    xxs_cycles: {
      Player::CycleFollower => 2,
    },
    xs_random: {
      Player::Gambler => 10,
    },
    xs_cycles: {
      Player::CycleFollower => 10,
    },
    random: {
      Player::Gambler => 100,
    },
    cycles: {
      Player::CycleFollower => 100,
    },
    xl_random: {
      Player::Gambler => 1000,
    },
    xl_cycles: {
      Player::CycleFollower => 1000,
    },
    perfect: {
      Player::Clairvoyant => 100,
    },
  }.freeze

  private_constant :STRATEGIES

  class << self
    def [](strategy)
      raise 'Unknown strategy!' unless STRATEGIES.key?(strategy)
      STRATEGIES[strategy]
    end
  end

end
