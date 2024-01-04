class Game

  def initialize(prisoner_tally)
    @game_ended = false
    @lamp = Lamp.new
    @prisoner_count = prisoner_tally.values.sum
    
    sequence = Sequence.new
    @prisoners = []
    prisoner_tally.each do |prisoner_type, count|
      count.times { @prisoners << prisoner_type.new(sequence.get_id, prisoner_count: @prisoner_count, &method(:end!)) }
    end
    
    @day = 1
  end
  
  def run(check: false)
    until @game_ended
      Logger.verbose(:print, Rainbow('.').green) if @day % 365 == 0

      @prisoners.sample.visit_room!(lamp: @lamp, day: @day)

      check! if check      
      @day += 1
    end
    
    Logger.verbose(:puts, '')
    Result.new(success: visitor_count == @prisoner_count, days: @day)
  end
  
  def end!
    @game_ended = true
  end

  private

  def visitor_count
    @prisoners.count(&:visited?)
  end

  def check!
    unless valid?
      @prisoners.each { |p| pp p.instance_variables.to_h { |ivar| [ivar, p.instance_variable_get(ivar)] } }
      debugger
    end
  end

  # CAUTION: slow!
  def valid?
    (@prisoners.sum { _1.value(lamp: @lamp, day: @day) } + @prisoners.first.lamp_value(lamp: @lamp, day: @day)) == @prisoner_count
  end

end

