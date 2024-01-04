module Prisoner::Utils::Checks

  def value(lamp:, day:)
    counts.zip(compound_factors).map { _1.inject(&:*) }.sum
  end
  
  def lamp_value(lamp:, day:)
    return 0 if lamp.off?
    return day if day <= interval_offset

    compound_factors[interval_type(day)]
  end

end
