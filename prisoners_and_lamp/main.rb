#! /bin/env ruby

require 'bundler/setup'
Bundler.require(:default)

loader = Zeitwerk::Loader.new
loader.push_dir(__dir__)
loader.setup

options = Options.parse!
Logger.verbose! if options[:verbose]
prisoner_tally = Strategies[options[:strategy]]

Logger.regular(:puts, Rainbow('=== Prisoners and Lamp ===').green)

results = (1..options[:sample_size]).map do |index|
  Logger.verbose(:print, "Game #{index.to_s.rjust(options[:sample_size].to_s.length)} ")
  Game.new(prisoner_tally).run(check: options[:check])
end

if results.all?(&:success)
  Logger.regular(:puts, Rainbow('All games won!').green)
else
  Logger.regular(:puts, Rainbow('Bad strategy!').red)
end

days = results.sum(&:days) / options[:sample_size].to_f
Logger.regular(:puts, "On average this strategy takes #{days} days. That's #{days / 365} years.")

normalization = (prisoner_tally.values.sum / 100.to_f) ** 2
UnicodePlot.boxplot(data: { days: results.map(&:days) }, width: 146, xlim: [0, 35*365*normalization]).render
