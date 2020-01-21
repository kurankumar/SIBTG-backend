class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    render({ json: Genre.all })
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    genre = Genre.create(genre_params)
    render json: genre, status: 201
  end

  def update
    @genre.update(genre_params)
    render json: @genre, status: 200
  end

  def destroy
    genreId = @genre.id
    @genre.destroy
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.fetch(:genre, {})
  end
end
