require 'optparse'

class Options

  def self.parse!
    options = { strategy: :cycles, sample_size: 100, verbose: false }

    OptionParser.new do |opts|
      opts.banner = 'Usage: main.rb [options]'

      opts.on('-s', '--strategy STRATEGY', 'Strategy') do |s|
        options[:strategy] = s.to_sym
      end

      opts.on('-n', '--sample-size NUMBER', 'Sample size') do |n|
        options[:sample_size] = n.to_i
      end

      opts.on('-v', '--[no-]verbose', 'Log individual games') do |v|
        options[:verbose] = v
      end
    end.parse!

    options
  end
end
