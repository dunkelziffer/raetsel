class Prisoner::Flex

  def self.[](factors: [100], intervals: [[100000, 0]])
    Class.new(Prisoner) do
      include Prisoner::Utils::Intervals
      include Prisoner::Utils::Actions
      include Prisoner::Utils::Checks

      class << self
        attr_accessor :class_factors, :class_intervals
      end

      self.class_factors = factors.dup
      self.class_intervals = intervals.dup
      
      def initialize(...)
        super
        @counts = [1] + [0] * self.class.class_factors.size
        @factors = self.class.class_factors.dup
        @aggregates = [0] * self.class.class_factors.size
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

        if day <= prisoner_count
          setup!(lamp:, day:)
        elsif aggregating?(level:)
          take!(lamp:, level:)
        else
          give!(lamp:, level:)
        end
        
        remember!(lamp:, level:) if last_day_of_interval?(day)
      end
      
      def setup!(lamp:, day:)
        if day == 1
          lamp.turn_on!
          @counts[0] -= 1
        elsif day <= prisoner_count
          if lamp.on?
            if @counts[0] == 0
              lamp.turn_off!
              @counts[0] += day - 1
              
              (1..day).each do |extra_day|
                # called for `1..day_of_first_duplicate` (all at once on a single day)
                setup_aggregation!(extra_day)
              end
              
              (day - 1).times { aggregate! }
            else
              @counts[0] -= 1
            end
          else
            # called for `day_of_first_duplicate..prisoner_count` (distributed over the remaining days)
            setup_aggregation!(day)
          end
          
          proclaim_success! if day == prisoner_count && lamp.on?
        end
      end

      # This needs to be called exactly once for each day in `1..prisoner_count`
      def setup_aggregation!(day)
        @factors.each_index do |index|
          if (prisoner_count + 1 - day) % compound_factors[-1 -index] == 0
            @aggregates[-1 -index] += 1
          end
        end
      end
      
      # for Prisoner::Utils::Intervals
      def interval_offset = prisoner_count
      def intervals = @intervals
      
      # for Prisoner::Utils::Checks
      def compound_factors = @compound_factors
      def counts = @counts
      
    end
  end
end

