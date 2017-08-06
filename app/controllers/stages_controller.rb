class StagesController < ApplicationController
  before_action :set_stage, only: [:show]
  before_action :authenticate_user!
  before_action :current_player


  def show
    set_player if session[:current_player].nil?
    session.keys.each do |k|
      puts "#{k}: #{session[k]}"
    end
    if request.method == "POST"
      if check_password
        current_player.update_stage(params[:stage][:stage_num])
        redirect_to "/stages", notice: "#{@stage.stage_num}번째 관문에 통과했습니다."
      else
        redirect_to request.referrer, notice: "#{@stage.stage_num}번째 관문 비밀번호가 틀렸습니다."
      end
    else

    end
  end


  private

  def check_stage

  end

  def check_password
    next_stage = Stage.find(params[:stage][:stage_num])
    next_stage.authenticate(params[:stage][:password])
  end

  def set_stage
    @stage = Stage.find(current_player.stage_num)
  end

  def set_player
    session[:current_player] = params[:team_type]
  end


end
