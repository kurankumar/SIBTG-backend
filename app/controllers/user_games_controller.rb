class UserGamesController < ApplicationController
  def index
    render json: { user_game: @user_game, games: @user_game.games }
  end

  def create
    @game = Game.find(user_game_params[:game_id])
    @user_game = UserGame.create(user_id: current_user.id, game_id: @game.id)
    render json: { user_game: @user_game, message: "Game added to your library!" }, status: :ok
  end

  private

  def user_game_params
    params.require(:user_game).permit(:game_id)
  end
end
