require "csv"
require_relative "./game"
require_relative "./team"
require_relative "./game_team"

class StatTracker
  attr_reader :games,
              :teams,
              :game_teams

  def self.from_csv(files)
    StatTracker.new(files)
  end

  def initialize(files)
    @games = (CSV.open files[:games], headers: true, header_converters: :symbol).map { |row| Game.new(row) }
    @teams = (CSV.open files[:teams], headers: true, header_converters: :symbol).map { |row| Team.new(row) }
    @game_teams = (CSV.open files[:game_teams], headers: true, header_converters: :symbol).map { |row| GameTeam.new(row) }
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

  def percentage_home_wins
    number_of_games = @games.count.to_f
    home_wins = @games.find_all do |game|
      game.home_goals > game.away_goals
    end
    (home_wins.count / number_of_games).round(2)
  end

  def percentage_visitor_wins
    number_of_games = @games.count.to_f
    visitor_wins = @games.find_all do |game|
      game.home_goals < game.away_goals
    end
    (visitor_wins.count / number_of_games).round(2)
  end

  def percentage_ties
    number_of_games = @games.count.to_f
    tie_games = @games.find_all do |game|
      game.home_goals == game.away_goals
    end
    (tie_games.count / number_of_games).round(2)
  end

  def highest_scoring_visitor
    away_goals = Hash.new(0)
    @game_teams.each do |game|
      if game.home_or_away == "away"
        away_goals[game.team_id] += game.goals
      end
      # away_goals[game.away_team_id] += game.away_goals
    end
    top_away = away_goals.max_by do |team, goals|
      goals

    end
    require 'pry'; binding.pry
    # games_played
    # require 'pry'; binding.pry
  end

  ### LEAGUE STATS ###
  ### TEAM STATS ###
end
