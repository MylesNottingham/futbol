require "spec_helper"

RSpec.describe Team do
  before(:each) do
    @team_1 = Team.new(
      {
        team_id: "1",
        franchiseid: "23",
        teamname: "Atlanta United",
        abbreviation: "ATL",
        stadium: "Mercedes-Benz Stadium"
      }
    )
    @team_2 = Team.new(
      {
        team_id: "28",
        franchiseid: "29",
        teamname: "Los Angeles FC",
        abbreviation: "LFC",
        stadium: "Banc of California Stadium"
      }
    )
  end

  describe "#initialize" do
    it "initializes a team from CSV and parses data" do
      expect(@team_1).to be_a(Team)
      expect(@team_1.id).to eq("1")
      expect(@team_1.franchise).to eq("23")
      expect(@team_1.name).to eq("Atlanta United")
      expect(@team_1.abbreviation).to eq("ATL")
      expect(@team_1.stadium).to eq("Mercedes-Benz Stadium")
    end

    it "intializes another team from CSV and parses data" do
      expect(@team_2).to be_a(Team)
      expect(@team_2.id).to eq("28")
      expect(@team_2.franchise).to eq("29")
      expect(@team_2.name).to eq("Los Angeles FC")
      expect(@team_2.abbreviation).to eq("LFC")
      expect(@team_2.stadium).to eq("Banc of California Stadium")
    end
  end
end
