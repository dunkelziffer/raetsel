class Strategies

  STRATEGIES = {
    xxs_random: {
      Player::Gambler => 2,
    },
    xxs_modulo: {
      Player::Modulator => 2,
    },
    xs_random: {
      Player::Gambler => 10,
    },
    xs_modulo: {
      Player::Modulator => 10,
    },
    random: {
      Player::Gambler => 100,
    },
    modulo: {
      Player::Modulator => 100,
    },
    xl_random: {
      Player::Gambler => 1000,
    },
    xl_modulo: {
      Player::Modulator => 1000,
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
