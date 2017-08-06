class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_player
    @current_player ||= Player.find(session[:current_player])
  end
  helper_method
end
