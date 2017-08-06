class Theme < ApplicationRecord
  has_many :players
  has_many :stages
  after_create :create_players_and_stages

  def create_players_and_stages
    ["과거팀", "현재팀"].each do |t|
      self.players.create(stage_num: 1, hint_count: 3, clear_list: "[]", team_type: t)
      puts t
      (1..15).to_a.each do |n|
        self.stages.create(stage_type: t, stage_num: n, password: "1234", password_confirmation: "1234")
      end
    end
  end
end
