class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    render json: @games
  end

  # GET /games/1
  # GET /games/1.json
  def show
      render json: @game
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    game = Game.create(game_params)
    render json: game, status: 201
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    @game.update(game_params)
    render json: @game, status: 200
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    gameId = @game.id
    @game.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_game
    @game = Game.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def game_params
    params.fetch(:game, {})
  end
end
