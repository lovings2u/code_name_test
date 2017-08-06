class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.references :theme, foreign_key: true
      t.string :stage_type                     # 과거팀/현재팀 문제 구분
      t.integer :stage_num
      t.string :password_digest
      t.float :gps_x
      t.float :gps_y
      t.text :description
      t.string :img_url, default: ""

      t.timestamps
    end
  end
end
