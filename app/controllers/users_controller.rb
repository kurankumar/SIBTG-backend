class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: { user: @users }
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def profile
    @wishlist = Wishlist.find(current_user.id)
    byebug
    render json: { user: current_user, wishlist: @wishlist.games, library: current_user.games }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: @token, message: "success" }, status: :created
    else
      render json: { message: "failed to create user" }, status: :not_acceptable
    end
  end

  def update
    @user.update(user_params)
    render json: @user, status: 200
  end

  def destroy
    userId = @user.id
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :bio, :password)
  end
end
