require "spec_helper"

RSpec.describe StatTracker do
  before(:each) do
    @stat_tracker = StatTracker.from_csv(
      {
        games: "./data/games.csv",
        teams: "./data/teams.csv"
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
end
