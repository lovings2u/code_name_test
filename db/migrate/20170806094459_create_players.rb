class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.references :theme, foreign_key: true
      t.integer :stage_num, default: 1          # 현재 플레이중인 stage
      t.integer :hint_count, default: 3         # 힌트 사용횟수
      t.integer :team_player_id                 # 함께 플레이중인 상대 player id
      t.string :team_type                       # 과거팀/현재팀
      t.string :clear_list                      # 클리어한 스테이지 목록
      t.datetime :start_time                    # 시작시간

      t.timestamps
    end
  end
end
