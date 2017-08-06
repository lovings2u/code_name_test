class ThemesController < ApplicationController
  before_action :set_theme, only: [:show]
  before_action :authenticate_user!

  def index
    @themes = Theme.all
  end

  def show
    @players = @theme.players
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to theme_path(@theme), notice: "새로운 테마가 등록되었습니다."
    else
      redirect_to new_theme_path
    end
  end

  private

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(:title)
  end
end
