class Prisoner::Nested < Prisoner
  include Prisoner::Utils::Intervals

  def initialize(...)
    super
    raise 'The prisoner type Prisoner::Nested only work with 100 prisoners!' if prisoner_count != 100
    @minor_remembered = 0
    @regular_remembered = 1
  end
  
  def visit_room!(lamp:, day:)
    super
    
    if aggregating?(day:)
      take!(lamp:, day:)
    else
      give!(lamp:, day:)
    end
    
    remember!(lamp:, day:) if last_day_of_interval?(day)
  end
  
  def give!(lamp:, day:)
    if lamp.off?
      case interval_type(day)
      when :majors_count_minors
        if @minor_remembered > 0
          lamp.turn_on!
          @minor_remembered -= 1
        end
      when :minors_count_regulars
        if @regular_remembered > 0
          lamp.turn_on!
          @regular_remembered -= 1
        end
      end
    end
  end
  
  def take!(lamp:, day:)
    if lamp.on?
      case interval_type(day)
      when :majors_count_minors
        lamp.turn_off!
        @minor_remembered += 1
        proclaim_success! if @minor_remembered == 10
      when :minors_count_regulars
        lamp.turn_off!
        @regular_remembered += 1
        
        if @regular_remembered >= 10
          @done = true
          @regular_remembered -= 10
          @minor_remembered += 1
        end
      end
    end
  end
  
  def remember!(lamp:, day:)
    if lamp.on?
      lamp.turn_off!
      case interval_type(day)
      when :minors_count_regulars
        @regular_remembered += 1
      when :majors_count_minors
        @minor_remembered += 1
      end
    end
  end

  # for Prisoner::Utils::Intervals
  def intervals
    [
      [2000, :minors_count_regulars],
      [2000, :majors_count_minors],
    ]
  end
  
  def value(lamp:, day:)
    10 * @minor_remembered + @regular_remembered
  end
  
  def lamp_value(lamp:, day:)
    if lamp.on?
      case interval_type(day)
      when :minors_count_regulars
        1
      when :majors_count_minors
        10
      end
    else
      0
    end
  end
end

