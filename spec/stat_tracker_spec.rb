require "spec_helper"

RSpec.describe StatTracker do
  before(:each) do
    @stat_tracker = StatTracker.from_csv(
      {
        games:      "./data/games.csv",
        teams:      "./data/teams.csv",
        game_teams: "./data/game_teams.csv"
      }
    )
  end

  describe "#initialize" do
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
      expect(@stat_tracker.game_teams.count).to eq(14882)
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
    it "returns the name of the team with the lowest average score per game across all seasons when they are a visitor." do
      expect(@stat_tracker.lowest_scoring_visitor).to eq "San Jose Earthquakes"
    end
  end

  describe "#lowest_scoring_home_team" do
    it "returns the name of the team with the lowest average score per game across all seasons when they are at home." do
      expect(@stat_tracker.lowest_scoring_home_team).to eq "Utah Royals FC"
    end
  end

  ### TEAM STATS ###

  ### HELPER METHODS ###
  describe "#total_games_played_by_team" do
    it "can find the total number of games played by each team" do
      expect(@stat_tracker.total_games_played_by_team).to be_a(Hash)
      expect(@stat_tracker.total_games_played_by_team.count).to eq(32)
      expect(@stat_tracker.total_games_played_by_team["28"]).to eq(516)
    end
  end

  describe "#total_goals_by_team" do
    it "can find the total number of goals scored by each team" do
      expect(@stat_tracker.total_goals_by_team).to be_a(Hash)
      expect(@stat_tracker.total_goals_by_team.count).to eq(32)
      expect(@stat_tracker.total_goals_by_team["28"]).to eq(1128)
    end
  end

  describe "#get_team_name" do
    it "can find the team name from the team id" do
      expect(@stat_tracker.get_team_name("28")).to eq("Los Angeles FC")
    end
  end
end
