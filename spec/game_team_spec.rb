require "spec_helper"

RSpec.describe GameTeam do
  before(:each) do
    @game_team_1 = GameTeam.new(
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
    @game_team_2 = GameTeam.new(
      {
        game_id: "2014030114",
        team_id: "9",
        hoa: "home",
        result: "WIN",
        settled_in: "REG",
        head_coach: "Dave Cameron",
        goals: "1",
        shots: "8",
        tackles: "34"
      }
    )
  end

  describe "#initialize" do
    it "can initialize a game_team from CSV and parse data" do
      expect(@game_team_1).to be_a(GameTeam)
      expect(@game_team_1.game_id).to eq("2012030221")
      expect(@game_team_1.team_id).to eq("3")
      expect(@game_team_1.result).to eq("LOSS")
      expect(@game_team_1.settled_in).to eq("OT")
      expect(@game_team_1.head_coach).to eq("John Tortorella")
      expect(@game_team_1.goals).to eq(2)
      expect(@game_team_1.shots).to eq(8)
      expect(@game_team_1.tackles).to eq(44)
    end

    it "can initialize another game_team from CSV and parse data" do
      expect(@game_team_2).to be_a(GameTeam)
      expect(@game_team_2.game_id).to eq("2014030114")
      expect(@game_team_2.team_id).to eq("9")
      expect(@game_team_2.result).to eq("WIN")
      expect(@game_team_2.settled_in).to eq("REG")
      expect(@game_team_2.head_coach).to eq("Dave Cameron")
      expect(@game_team_2.goals).to eq(1)
      expect(@game_team_2.shots).to eq(8)
      expect(@game_team_2.tackles).to eq(34)
    end
  end

  describe "#home?" do
    it "returns false if the game_team is away" do
      expect(@game_team_1.home?).to eq(false)
    end

    it "returns true if the game_team is home" do
      expect(@game_team_2.home?).to eq(true)
    end
  end
end
