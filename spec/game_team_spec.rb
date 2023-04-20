require "spec_helper"

RSpec.describe GameTeam do
  describe "#initialize" do
    it "initializes from CSV and parses data" do
      game_team_1 = GameTeam.new(
        {
          game_id: "2012030221",
          team_id: "3",
          hoa: "away",
          result: "LOSS",
          settled_in: "OT",
          head_coach: "John Tortorella",
          goals: "2",
          shots: "8",
          tackles: "44"
        }
      )
      expect(game_team_1).to be_a(GameTeam)
      expect(game_team_1.game_id).to eq("2012030221")
      expect(game_team_1.team_id).to eq("3")
      expect(game_team_1.home_or_away).to eq("away")
      expect(game_team_1.result).to eq("LOSS")
      expect(game_team_1.settled_in).to eq("OT")
      expect(game_team_1.head_coach).to eq("John Tortorella")
      expect(game_team_1.goals).to eq(2)
      expect(game_team_1.shots).to eq(8)
      expect(game_team_1.tackles).to eq(44)
    end
  end
end
