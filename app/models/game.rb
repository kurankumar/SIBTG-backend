class Game < ApplicationRecord
  belongs_to :genre, optional: true

  has_many :reviews

  has_many :user_games
  has_many :users, through: :user_games

  belongs_to :wishlist, optional: true
end
