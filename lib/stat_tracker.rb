require "csv"
require_relative "./game"
require_relative "./team"

class StatTracker
  attr_reader :games,
              :teams

  def self.from_csv(files)
    StatTracker.new(files)
  end

  def initialize(files)
    @games = (CSV.open files[:games], headers: true, header_converters: :symbol).map { |row| Game.new(row) }
    @teams = (CSV.open files[:teams], headers: true, header_converters: :symbol).map { |row| Team.new(row) }
  end

  ### GAME STATS ###
  def highest_total_score
    highest_game = @games.max_by do |game|
      game.away_goals + game.home_goals
    end
    highest_game.away_goals + highest_game.home_goals
  end

  def lowest_total_score
    lowest_game = @games.min_by do |game|
      game.away_goals + game.home_goals
    end
    lowest_game.away_goals + lowest_game.home_goals
  end
  ### LEAGUE STATS ###
  ### TEAM STATS ###
end
