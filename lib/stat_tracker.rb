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

  ### LEAGUE STATS ###
  def count_of_teams
    @teams.count
  end

  def best_offense
    team_games = Hash.new(0)
    team_goals = Hash.new(0)

    @games.each do |game|
      team_games[game.home_team_id] += 1
      team_games[game.away_team_id] += 1
      team_goals[game.home_team_id] += game.home_goals
      team_goals[game.away_team_id] += game.away_goals
    end

    best_offense = team_games.max_by do |team_id, games|
      team_goals[team_id] / games
    end[0]

    @teams.find do |team|
      team.team_id == best_offense
    end
  end

  def worst_offense
    team_games = Hash.new(0)
    team_goals = Hash.new(0)

    @games.each do |game|
      team_games[game.home_team_id] += 1
      team_games[game.away_team_id] += 1
      team_goals[game.home_team_id] += game.home_goals
      team_goals[game.away_team_id] += game.away_goals
    end

    worst_offense = team_games.min_by do |team_id, games|
      team_goals[team_id] / games
    end[0]

    @teams.find do |team|
      team.team_id == worst_offense
    end
  end

  ### TEAM STATS ###
end
