class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifications:#{@current_player.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
