require 'optparse'

class Options

  def self.parse!
    options = { strategy: :basic, sample_size: 100, verbose: false, check: false }

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

      opts.on('-c', '--[no-]check', 'Check invariant each day (SLOW!!!) and enter debugger on failure') do |c|
        options[:check] = c
      end      
    end.parse!
    
    options
  end

  def self.parse_for_compare!
    options = { strategies: [:basic], sample_size: 100, normalization: 1 }

    OptionParser.new do |opts|
      opts.banner = 'Usage: compare.rb [options]'
      
      opts.on('-s', '--strategies STRATEGIES', 'Strategies (comma separated)') do |s|
        options[:strategies] = s.split(',').map(&:to_sym)
      end

      opts.on('-p', '--prisoners PRISONERS', 'Common assumed number of prisoners (for box plot normalization)') do |p|
        options[:normalization] = (p.to_i / 100) ** 2
      end
      
      opts.on('-n', '--sample-size NUMBER', 'Sample size') do |n|
        options[:sample_size] = n.to_i
      end
    end.parse!
    
    options
  end

end
