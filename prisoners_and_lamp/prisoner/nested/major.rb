class Prisoner::Nested::Major < Prisoner::Nested

  def aggregating?(day:)
    interval_type(day) == :majors_count_minors
  end

end

