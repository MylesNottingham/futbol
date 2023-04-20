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

  describe "#highest_scoring_visitor" do
    it "finds the name of the team with the highest average score per game across all seasons when they are away." do
      expect(@stat_tracker.highest_scoring_visitor).to eq "FC Dallas"
    end
  end

  describe "#highest_scoring_home_team" do
    it "" do
      expect(@stat_tracker.highest_scoring_home_team).to eq "Reign FC"
    end
  end
end
