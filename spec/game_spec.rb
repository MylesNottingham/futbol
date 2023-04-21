require "spec_helper"

RSpec.describe Game do
  before(:each) do
    @game_1 = Game.new(
      {
        game_id: "2012030221",
        season: "20122013",
        type: "Postseason",
        date_time: "5/16/13",
        away_team_id: "3",
        home_team_id: "6",
        away_goals: "2",
        home_goals: "3",
        venue: "Toyota Stadium"
      }
    )
    @game_2 = Game.new(
      {
        game_id: "2013020442",
        season: "20132014",
        type: "Regular Season",
        date_time: "12/8/13",
        away_team_id: "52",
        home_team_id: "14",
        away_goals: "2",
        home_goals: "1",
        venue: "Audi Field"
      }
    )
  end

  describe "#initialize" do
    it "initializes a game from CSV and parses data" do
      expect(@game_1).to be_a(Game)
      expect(@game_1.game_id).to eq("2012030221")
      expect(@game_1.season).to eq("20122013")
      expect(@game_1.type).to eq("Postseason")
      expect(@game_1.date_time).to eq("5/16/13")
      expect(@game_1.away_team_id).to eq("3")
      expect(@game_1.home_team_id).to eq("6")
      expect(@game_1.away_goals).to eq(2)
      expect(@game_1.home_goals).to eq(3)
      expect(@game_1.venue).to eq("Toyota Stadium")
    end

    it "initializes another game from CSV and parses data" do
      expect(@game_2).to be_a(Game)
      expect(@game_2.game_id).to eq("2013020442")
      expect(@game_2.season).to eq("20132014")
      expect(@game_2.type).to eq("Regular Season")
      expect(@game_2.date_time).to eq("12/8/13")
      expect(@game_2.away_team_id).to eq("52")
      expect(@game_2.home_team_id).to eq("14")
      expect(@game_2.away_goals).to eq(2)
      expect(@game_2.home_goals).to eq(1)
      expect(@game_2.venue).to eq("Audi Field")
    end
  end
end
