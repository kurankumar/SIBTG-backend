class WishlistsController < ApplicationController
  before_action :set_wishlist, only: [:index]

  def index
    render json: { wishlist: @wishlist, games: @wishlist.games }
  end

  def create
    @wishlist = Wishlist.find_or_create_by(user_id: current_user.id)
    @game = Game.find(wishlist_params[:game_id])
    @wishlist.games << @game
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
