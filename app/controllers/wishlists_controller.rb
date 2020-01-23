class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:index]

  def index
    render json: { wishlist: @wishlist, games: @wishlist.games }
  end

  def create
    @game = Game.find(wishlist_params[:game_id])
    @user_game = UserGame.create(user_id: current_user.id, game_id: @game.id, wishlist: true)
    @wishlist = current_user.user_games.select { |user_game| user_game.wishlist == true }.map { |user_game| user_game.game }
    render json: { wishlist: @wishlist, message: "Game added to your wishlist!" }, status: :ok
  end

  private

  def set_wishlist
    @wishlist = Wishlist.find(current_user.id)
  end

  def wishlist_params
    params.require(:wishlist).permit(:game_id)
  end
end
