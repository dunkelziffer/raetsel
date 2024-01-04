class Prisoner::Versatile

  def self.[](factors: [100], intervals: [[100000, 0]], aggregates: [0])
    Class.new(Prisoner) do
      include Prisoner::Utils::Intervals
      include Prisoner::Utils::Actions
      include Prisoner::Utils::Checks

      class << self
        attr_accessor :class_factors, :class_intervals, :class_aggregates
      end

      self.class_factors = factors.dup
      self.class_intervals = intervals.dup
      self.class_aggregates = aggregates.dup
      
      def initialize(...)
        super
        raise 'The prisoner type Prisoner::Versatile only works with 100 prisoners!' if prisoner_count != 100
        @counts = [1] + [0] * self.class.class_factors.size
        @factors = self.class.class_factors.dup
        @aggregates = self.class.class_aggregates.dup
        @intervals = self.class.class_intervals.dup

        @compound_factors = begin
          fs = [1]
          @factors.each_index do |index|
            fs << @factors[0..index].inject(&:*)
          end
          fs
        end
      end
      
      def visit_room!(lamp:, day:)
        super
        
        level = interval_type(day)

        if aggregating?(level:)
          take!(lamp:, level:)
        else
          give!(lamp:, level:)
        end
        
        remember!(lamp:, level:) if last_day_of_interval?(day)
      end
      
      # for Prisoner::Utils::Intervals
      def intervals = @intervals
      
      # for Prisoner::Utils::Checks
      def compound_factors = @compound_factors
      def counts = @counts
      
    end
  end
end

