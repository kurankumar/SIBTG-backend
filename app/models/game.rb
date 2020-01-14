class Game < ApplicationRecord
  belongs_to :genre

  has_many :reviews
  has_many :user_games
  has_many :users, through: :user_games
end
