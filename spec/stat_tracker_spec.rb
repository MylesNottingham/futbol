require "spec_helper"

RSpec.describe StatTracker do
  before(:each) do
    @stat_tracker = StatTracker.from_csv(
      { games: "./data/games.csv" }
    )
  end

  describe "#initialize" do
    it "can initialize with attributes" do
      expect(@stat_tracker).to be_a(StatTracker)
      expect(@stat_tracker.games).to be_an(Array)
      expect(@stat_tracker.games.count).to eq(7441)
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

  describe "#count_of_games_by_season" do
    it "can count total number of games by season" do
      expect(@stat_tracker.count_of_games_by_season).to eq({
        "20122013" => 806,
        "20162017" => 1317,
        "20142015" => 1319,
        "20152016" => 1321,
        "20132014" => 1323,
        "20172018" => 1355
        })
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
      "20122013"=>4.12,
      "20162017"=>4.23,
      "20142015"=>4.14,
      "20152016"=>4.16,
      "20132014"=>4.19,
      "20172018"=>4.44
    }
      expect(@stat_tracker.average_goals_by_season).to eq(expected)
    end
  end
end
