class Team
  attr_reader :id,
              :franchise,
              :name,
              :abbreviation,
              :stadium

  def initialize(row)
    @id           = row[:team_id]
    @franchise    = row[:franchiseid]
    @name         = row[:teamname]
    @abbreviation = row[:abbreviation]
    @stadium      = row[:stadium]
  end
end
