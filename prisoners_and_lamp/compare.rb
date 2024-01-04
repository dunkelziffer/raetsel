#! /bin/env ruby

require 'bundler/setup'
Bundler.require(:default)

loader = Zeitwerk::Loader.new
loader.push_dir(__dir__)
loader.setup

options = Options.parse_for_compare!

Logger.regular(:puts, Rainbow('=== Prisoners and Lamp ===').green)

successful = {}
failed = []

options[:strategies].each do |strategy|
  Logger.regular(:print, "Strategy #{strategy.to_s.ljust(options[:strategies].map { _1.to_s.size }.max)} ")
  
  prisoner_tally = Strategies[strategy]
  results = (1..options[:sample_size]).map do |index|
    Logger.regular(:print, Rainbow('.').green)
    Game.new(prisoner_tally).run
  end

  Logger.regular(:puts, '')

  if results.all?(&:success)
    successful[strategy] = results.map(&:days)
  else
    failed << strategy
  end
end

UnicodePlot.boxplot(data: successful, width: 146, xlim: [0, 35*365*options[:normalization]]).render

if failed.any?
  Logger.regular(:puts, Rainbow("The following strategies failed: #{failed.join(', ')}").red)
end
