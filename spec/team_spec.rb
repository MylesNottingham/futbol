require "spec_helper"

RSpec.describe Team do
  describe "#initialize" do
    it "initializes from CSV and parses data" do
      team_1 = Team.new(
        {
          team_id: "1",
          franchiseid: "23",
          teamname: "Atlanta United",
          abbreviation: "ATL",
          stadium: "Mercedes-Benz Stadium",
          link: "/api/v1/teams/1"
        }
      )

      expect(team_1).to be_a(Team)
      expect(team_1.id).to eq("1")
      expect(team_1.franchise).to eq("23")
      expect(team_1.name).to eq("Atlanta United")
      expect(team_1.abbreviation).to eq("ATL")
      expect(team_1.stadium).to eq("Mercedes-Benz Stadium")
    end
  end
end
