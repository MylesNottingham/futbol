require "spec_helper"

RSpec.describe StatTracker do
  before(:each) do
    @stat_tracker = StatTracker.from_csv(
      {
        games: "./data/games.csv",
        teams: "./data/teams.csv",
        game_teams: "./data/game_teams.csv"
      }
    )
  end

  describe "#initialize(files)" do
    it "can initialize with games" do
      expect(@stat_tracker).to be_a(StatTracker)
      expect(@stat_tracker.games).to be_an(Array)
      expect(@stat_tracker.games.count).to eq(7441)
    end

    it "can initialize with teams" do
      expect(@stat_tracker).to be_a(StatTracker)
      expect(@stat_tracker.teams).to be_an(Array)
      expect(@stat_tracker.teams.count).to eq(32)
    end

    it "can initialize with game teams" do
      expect(@stat_tracker).to be_a(StatTracker)
      expect(@stat_tracker.game_teams).to be_an(Array)
      expect(@stat_tracker.game_teams.count).to eq(14_882)
    end
  end

  ### GAME STATS ###
  describe "#highest_total_score" do
    it "can find the highest total score" do
      expect(@stat_tracker.highest_total_score).to eq(11)
    end
  end

  describe "#lowest_total_score" do
    it "can find the lowest total score" do
      expect(@stat_tracker.lowest_total_score).to eq(0)
    end
  end

  describe "#percentage_home_wins" do
    it "can find the percentage of home wins" do
      expect(@stat_tracker.percentage_home_wins).to eq(0.44)
    end
  end

  describe "#percentage_visitor_wins" do
    it "can find the percentage of visitor wins" do
      expect(@stat_tracker.percentage_visitor_wins).to eq(0.36)
    end
  end

  describe "#percentage_ties" do
    it "can find the percentage of tie games" do
      expect(@stat_tracker.percentage_ties).to eq(0.2)
    end
  end

  describe "#count_of_games_by_season" do
    it "can count total number of games by season" do
      expect(@stat_tracker.count_of_games_by_season).to eq(
        {
          "20122013" => 806,
          "20162017" => 1317,
          "20142015" => 1319,
          "20152016" => 1321,
          "20132014" => 1323,
          "20172018" => 1355
        }
      )
    end
  end

  describe "#average_goals_per_game" do
    it "can average the goals scored in a game across all seasons" do
      expect(@stat_tracker.average_goals_per_game).to eq(4.22)
    end
  end

  describe "#average_goals_by_season" do
    it "returns hash of average goals by season" do
      expected = {
        "20122013" => 4.12,
        "20162017" => 4.23,
        "20142015" => 4.14,
        "20152016" => 4.16,
        "20132014" => 4.19,
        "20172018" => 4.44
      }
      expect(@stat_tracker.average_goals_by_season).to eq(expected)
    end
  end

  ### LEAGUE STATS ###
  describe "#count_of_teams" do
    it "can count the number of teams" do
      expect(@stat_tracker.count_of_teams).to eq(32)
    end
  end

  describe "#best_offense" do
    it "can find the team with the best offense" do
      expect(@stat_tracker.best_offense).to eq("Reign FC")
    end
  end

  describe "#worst_offense" do
    it "can find the team with the worst offense" do
      expect(@stat_tracker.worst_offense).to eq("Utah Royals FC")
    end
  end

  describe "#highest_scoring_visitor" do
    it "finds the name of the team with the highest average score per game across all seasons when they are away." do
      expect(@stat_tracker.highest_scoring_visitor).to eq("FC Dallas")
    end
  end

  describe "#highest_scoring_home_team" do
    it "finds the name of the team with the highest average score per game across all seasons when they are home" do
      expect(@stat_tracker.highest_scoring_home_team).to eq("Reign FC")
    end
  end

  describe "#lowest_scoring_visitor" do
    it "returns team name with the lowest average score per game across all seasons when they are a visitor." do
      expect(@stat_tracker.lowest_scoring_visitor).to eq "San Jose Earthquakes"
    end
  end

  describe "#lowest_scoring_home_team" do
    it "returns team name with the lowest average score per game across all seasons when they are at home." do
      expect(@stat_tracker.lowest_scoring_home_team).to eq("Utah Royals FC")
    end
  end

  ### SEASON STATS ###
  describe "#winningest_coach(season)" do
    it "return the name of the coach with the best win percentage for the season" do
      expect(@stat_tracker.winningest_coach("20132014")).to eq("Claude Julien")
      expect(@stat_tracker.winningest_coach("20142015")).to eq("Alain Vigneault")
    end
  end

  describe "#worst_coach(season)" do
    it "return the name of the coach with the worst win percentage for the season" do
      expect(@stat_tracker.worst_coach("20132014")).to eq("Peter Laviolette")
      expect(@stat_tracker.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
  end

  describe "#most_accurate_team(season)" do
    it "can find the team with the best shooting percentage in season" do
      expect(@stat_tracker.most_accurate_team("20122013")).to eq("DC United")
    end
  end

  describe "#least_accurate_team(season)" do
    it "can find the team with the worst shooting percentage in season" do
      expect(@stat_tracker.least_accurate_team("20122013")).to eq("New York City FC")
    end
  end

  describe "#most_tackles(season)" do
    it "can find the team with the most tackles in season" do
      expect(@stat_tracker.most_tackles("20122013")).to eq("FC Cincinnati")
    end
  end

  describe "#fewest_tackles(season)" do
    it "can find the team with the fewest tackles in season" do
      expect(@stat_tracker.fewest_tackles("20122013")).to eq("Atlanta United")
    end
  end

  ### HELPER METHODS ###
  describe "#percentage(stats)" do
    it "gives a float to the nearest 100th percent" do
      expect(@stat_tracker.percentage(2687)).to eq(0.36)
      expect(@stat_tracker.percentage(10_322)).to eq(1.39)
      expect(@stat_tracker.percentage(19_881)).to eq(2.67)
    end
  end

  describe "#number_of_games" do
    it "can get the total number of games as a float" do
      expect(@stat_tracker.number_of_games).to eq(7441.0)
    end
  end

  describe "#total_games_played_by_team_in_games" do
    it "can find the total number of games played by a team" do
      expect(@stat_tracker.total_games_played_by_team_in_games).to be_a(Hash)
      expect(@stat_tracker.total_games_played_by_team_in_games.count).to eq(32)
      expect(@stat_tracker.total_games_played_by_team_in_games["28"]).to eq(516)
    end

    it "can find the total number of games played by other teams" do
      expect(@stat_tracker.total_games_played_by_team_in_games["6"]).to eq(510)
      expect(@stat_tracker.total_games_played_by_team_in_games["17"]).to eq(489)
      expect(@stat_tracker.total_games_played_by_team_in_games["19"]).to eq(507)
    end
  end

  describe "#total_goals_by_team_in_games" do
    it "can find the total number of goals scored by a team" do
      expect(@stat_tracker.total_goals_by_team_in_games).to be_a(Hash)
      expect(@stat_tracker.total_goals_by_team_in_games.count).to eq(32)
      expect(@stat_tracker.total_goals_by_team_in_games["28"]).to eq(1128)
    end

    it "can find the total number of goals scored by other teams" do
      expect(@stat_tracker.total_goals_by_team_in_games["15"]).to eq(1168)
      expect(@stat_tracker.total_goals_by_team_in_games["24"]).to eq(1146)
      expect(@stat_tracker.total_goals_by_team_in_games["4"]).to eq(972)
    end
  end

  describe "#total_goals_by_home_team" do
    it "gets the total goals scored by a home team as floats" do
      expect(@stat_tracker.total_goals_by_home_team["3"]).to eq(557.0)
      expect(@stat_tracker.total_goals_by_home_team["21"]).to eq(523.0)
      expect(@stat_tracker.total_goals_by_home_team["12"]).to eq(474.0)
    end
  end

  describe "#total_goals_by_away_team" do
    it "gets the total goals scored by an away team as floats" do
      expect(@stat_tracker.total_goals_by_away_team["3"]).to eq(572.0)
      expect(@stat_tracker.total_goals_by_away_team["6"]).to eq(568.0)
      expect(@stat_tracker.total_goals_by_away_team["24"]).to eq(553.0)
    end
  end

  describe "#get_team_name(id)" do
    it "can find the team name from the given team id" do
      expect(@stat_tracker.get_team_name("28")).to eq("Los Angeles FC")
      expect(@stat_tracker.get_team_name("1")).to eq("Atlanta United")
      expect(@stat_tracker.get_team_name("25")).to eq("Chicago Red Stars")
    end
  end

  describe "games_by_season(season)" do
    it "can find all games by a given season" do
      expect(@stat_tracker.games_by_season("20122013")).to be_an(Array)
      expect(@stat_tracker.games_by_season("20122013").count).to eq(806)
      expect(@stat_tracker.games_by_season("20122013").first).to be_a(Game)
      @stat_tracker.games_by_season("20122013").each do |game|
        expect(game.season).to eq("20122013")
      end
    end

    it "can find all games by another given season" do
      expect(@stat_tracker.games_by_season("20162017")).to be_an(Array)
      expect(@stat_tracker.games_by_season("20162017").count).to eq(1317)
      expect(@stat_tracker.games_by_season("20162017").first).to be_a(Game)
      @stat_tracker.games_by_season("20162017").each do |game|
        expect(game.season).to eq("20162017")
      end
    end

    it "can find all games by yet another given season" do
      expect(@stat_tracker.games_by_season("20132014")).to be_an(Array)
      expect(@stat_tracker.games_by_season("20132014").count).to eq(1323)
      expect(@stat_tracker.games_by_season("20132014").first).to be_a(Game)
      @stat_tracker.games_by_season("20132014").each do |game|
        expect(game.season).to eq("20132014")
      end
    end
  end

  describe "generate_game_ids(games)" do
    it "can generate an array of game ids from an array of games" do
      expect(@stat_tracker.generate_game_ids(@stat_tracker.games)).to be_an(Array)
      expect(@stat_tracker.generate_game_ids(@stat_tracker.games).count).to eq(7441)
      expect(@stat_tracker.generate_game_ids(@stat_tracker.games).first).to eq("2012030221")
      @stat_tracker.generate_game_ids(@stat_tracker.games).each do |game_id|
        expect(game_id).to be_a(String)
      end
    end
  end

  describe "filter_game_teams(game_ids)" do
    it "can filter game_teams by a given game_id" do
      expect(@stat_tracker.filter_game_teams(["2012030221"])).to be_an(Array)
      expect(@stat_tracker.filter_game_teams(["2012030221"]).count).to eq(2)
      expect(@stat_tracker.filter_game_teams(["2012030221"]).first).to be_a(GameTeam)
      @stat_tracker.filter_game_teams(["2012030221"]).each do |game_team|
        expect(game_team.game_id).to eq("2012030221")
      end
    end

    it "can filter game_teams by another given game_id" do
      expect(@stat_tracker.filter_game_teams(["2013021119"])).to be_an(Array)
      expect(@stat_tracker.filter_game_teams(["2013021119"]).count).to eq(2)
      expect(@stat_tracker.filter_game_teams(["2013021119"]).first).to be_a(GameTeam)
      @stat_tracker.filter_game_teams(["2013021119"]).each do |game_team|
        expect(game_team.game_id).to eq("2013021119")
      end
    end

    it "can filter game_teams by yet another given game_id" do
      expect(@stat_tracker.filter_game_teams(["2013020251"])).to be_an(Array)
      expect(@stat_tracker.filter_game_teams(["2013020251"]).count).to eq(2)
      expect(@stat_tracker.filter_game_teams(["2013020251"]).first).to be_a(GameTeam)
      @stat_tracker.filter_game_teams(["2013020251"]).each do |game_team|
        expect(game_team.game_id).to eq("2013020251")
      end
    end
  end

  describe "find_total_shots_by_team(game_teams)" do
    it "can find the total number of shots taken by a team" do
      expect(@stat_tracker.find_total_shots_by_team(@stat_tracker.game_teams)).to be_a(Hash)
      expect(@stat_tracker.find_total_shots_by_team(@stat_tracker.game_teams).count).to eq(32)
      expect(@stat_tracker.find_total_shots_by_team(@stat_tracker.game_teams)["28"]).to eq(3901)
    end

    it "can find the total number of shots take by other teams" do
      expect(@stat_tracker.find_total_shots_by_team(@stat_tracker.game_teams)["18"]).to eq(3739)
      expect(@stat_tracker.find_total_shots_by_team(@stat_tracker.game_teams)["23"]).to eq(3254)
      expect(@stat_tracker.find_total_shots_by_team(@stat_tracker.game_teams)["15"]).to eq(3761)
    end
  end

  describe "find_total_goals_by_team(game_teams)" do
    it "can find the total number of goals made by a team" do
      expect(@stat_tracker.find_total_goals_by_team(@stat_tracker.game_teams)).to be_a(Hash)
      expect(@stat_tracker.find_total_goals_by_team(@stat_tracker.game_teams).count).to eq(32)
      expect(@stat_tracker.find_total_goals_by_team(@stat_tracker.game_teams)["28"]).to eq(1128)
    end

    it "can find the total number of goals made by other teams" do
      expect(@stat_tracker.find_total_goals_by_team(@stat_tracker.game_teams)["3"]).to eq(1129)
      expect(@stat_tracker.find_total_goals_by_team(@stat_tracker.game_teams)["12"]).to eq(936)
      expect(@stat_tracker.find_total_goals_by_team(@stat_tracker.game_teams)["25"]).to eq(1061)
    end
  end

  describe "find_total_tackles_by_team(game_teams)" do
    it "can find the total number of tackles made by a team" do
      expect(@stat_tracker.find_total_tackles_by_team(@stat_tracker.game_teams)).to be_a(Hash)
      expect(@stat_tracker.find_total_tackles_by_team(@stat_tracker.game_teams).count).to eq(32)
      expect(@stat_tracker.find_total_tackles_by_team(@stat_tracker.game_teams)["28"]).to eq(11_149)
    end

    it "can find the total number of tackles made by other teams" do
      expect(@stat_tracker.find_total_tackles_by_team(@stat_tracker.game_teams)["14"]).to eq(11_769)
      expect(@stat_tracker.find_total_tackles_by_team(@stat_tracker.game_teams)["19"]).to eq(11_921)
      expect(@stat_tracker.find_total_tackles_by_team(@stat_tracker.game_teams)["27"]).to eq(3_433)
    end
  end
end
