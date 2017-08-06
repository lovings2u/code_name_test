class Player < ApplicationRecord
  belongs_to :theme
  has_many :notifications, as: :recipient
  serialize :clear_list

  def update_stage(stage)
    update(stage_num: stage)
    Notification.create(recipient_id: team_player_id, notifiable_type: "Player", notifiable_id: team_player_id, action: "cleared", player_id: self.id)
  end

  def use_hint
    update(hint_count: self.hint_count-1)
  end
end
