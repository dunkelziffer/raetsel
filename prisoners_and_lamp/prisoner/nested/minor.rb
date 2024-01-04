class Prisoner::Nested::Minor < Prisoner::Nested
  
  def aggregating?(day:)
    # We need to only aggregate once! `@done` gets set to true on aggregation.
    interval_type(day) == :minors_count_regulars && !@done
  end

end

