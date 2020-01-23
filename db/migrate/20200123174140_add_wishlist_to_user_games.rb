class AddWishlistToUserGames < ActiveRecord::Migration[6.0]
  def change
    add_column :user_games, :wishlist, :boolean, default: false
  end
end
