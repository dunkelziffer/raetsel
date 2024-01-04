class Strategies
  
  STRATEGIES = {
    xs_lucky_interval: {
      Prisoner::UniverseHeatDeathSurvivor => 10,
    },
    perfect: {
      Prisoner::Clairvoyant => 100,
    },
    flex_100: {
      Prisoner::Flex[factors: [100], intervals: [[100000, 0]]] => 100,
    },
    flex_10_10: {
      Prisoner::Flex[factors: [10, 10], intervals: [[2000, 0], [2000, 1]]] => 100,
    },
    flex_20_5: {
      Prisoner::Flex[factors: [20, 5], intervals: [[3500, 0], [2000, 1]]] => 100,
    },
    flex_5_20: {
      Prisoner::Flex[factors: [5, 20], intervals: [[1000, 0], [3000, 1]]] => 100,
    },
    flex_5_5_4: {
      Prisoner::Flex[factors: [5, 5, 4], intervals: [[1500, 0], [1500, 1], [1500, 2]]] => 100,
    },
    versatile_100: {
      Prisoner::Versatile[factors: [100], intervals: [[100000, 0]], aggregates: [1]] => 1,
      Prisoner::Versatile[factors: [100], intervals: [[100000, 0]], aggregates: [0]] => 99,
    },
    versatile_10_10: {
      Prisoner::Versatile[factors: [10, 10], intervals: [[2000, 0], [2000, 1]], aggregates: [0, 1]] => 1,
      Prisoner::Versatile[factors: [10, 10], intervals: [[2000, 0], [2000, 1]], aggregates: [1, 0]] => 10,
      Prisoner::Versatile[factors: [10, 10], intervals: [[2000, 0], [2000, 1]], aggregates: [0, 0]] => 89,
    },
    versatile_20_5: {
      Prisoner::Versatile[factors: [20, 5], intervals: [[2000, 0], [2000, 1]], aggregates: [0, 1]] => 1,
      Prisoner::Versatile[factors: [20, 5], intervals: [[2000, 0], [2000, 1]], aggregates: [1, 0]] => 5,
      Prisoner::Versatile[factors: [20, 5], intervals: [[2000, 0], [2000, 1]], aggregates: [0, 0]] => 94,
    },
    versatile_5_20: {
      Prisoner::Versatile[factors: [5, 20], intervals: [[2000, 0], [2000, 1]], aggregates: [0, 1]] => 1,
      Prisoner::Versatile[factors: [5, 20], intervals: [[2000, 0], [2000, 1]], aggregates: [1, 0]] => 20,
      Prisoner::Versatile[factors: [5, 20], intervals: [[2000, 0], [2000, 1]], aggregates: [0, 0]] => 79,
    },
    versatile_5_5_4: {
      Prisoner::Versatile[factors: [5, 5, 4], intervals: [[2000, 0], [1500, 1], [1500, 2]], aggregates: [0, 0, 1]] => 1,
      Prisoner::Versatile[factors: [5, 5, 4], intervals: [[2000, 0], [1500, 1], [1500, 2]], aggregates: [0, 1, 0]] => 4,
      Prisoner::Versatile[factors: [5, 5, 4], intervals: [[2000, 0], [1500, 1], [1500, 2]], aggregates: [1, 0, 0]] => 20,
      Prisoner::Versatile[factors: [5, 5, 4], intervals: [[2000, 0], [1500, 1], [1500, 2]], aggregates: [0, 0, 0]] => 75,
    },
    nested: {
      Prisoner::Nested::Major => 1,
      Prisoner::Nested::Minor => 10,
      Prisoner::Nested::Regular => 89,
    },
    dynamic: {
      Prisoner::DynamicCounter => 100,
    },
    basic: {
      Prisoner::Counter => 1,
      Prisoner::Regular => 99,
    },
    lucky_interval: {
      Prisoner::UniverseHeatDeathSurvivor => 100,
    },
    xl_flex_10_10_10: {
      Prisoner::Flex[factors: [10, 10, 10], intervals: [[6000, 0], [6000, 1], [6000, 2]]] => 1000,
    },
    xl_flex_5_25_8: {
      Prisoner::Flex[factors: [5, 25, 8], intervals: [[2000, 0], [6000, 1], [6000, 2]]] => 1000,
    },
    xl_flex_40_25: {
      Prisoner::Flex[factors: [40, 25], intervals: [[10000, 0], [10000, 1]]] => 1000,
    },
    xl_flex_1000: {
      Prisoner::Flex[factors: [1000], intervals: [[100000, 0]]] => 1000,
    },
    xl_perfect: {
      Prisoner::Clairvoyant => 1000,
    },
    xl_dynamic: {
      Prisoner::DynamicCounter => 1000,
    },
    xl_basic: {
      Prisoner::Counter => 1,
      Prisoner::Regular => 999,
    },
    xl_lucky_interval: {
      Prisoner::UniverseHeatDeathSurvivor => 1000,
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
