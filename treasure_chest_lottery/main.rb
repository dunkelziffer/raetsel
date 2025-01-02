#! /bin/env ruby

require 'bundler/setup'
Bundler.require(:default)

loader = Zeitwerk::Loader.new
loader.push_dir(__dir__)
loader.setup

options = Options.parse!
Logger.verbose! if options[:verbose]

player_tally = Strategies[options[:strategy]]

Logger.regular(:puts, Rainbow('=== Treasure chest lottery ===').green)

results = (1..options[:sample_size]).map do |index|
  Logger.verbose(:print, "Game #{index.to_s.rjust(options[:sample_size].to_s.length)} ")
  Game.new(player_tally).run
end

win_rate = results.select(&:success).size.to_f / results.size.to_f
Logger.regular(:puts, "Win rate: #{sprintf('%.1f', win_rate * 100)}%")

UnicodePlot.barplot(data: results.map(&:successful_players).sort.tally, title: "Successful players").render
