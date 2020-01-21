class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    render({ json: Review.all })
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    review = Review.create(review_params)
    render json: review, status: 201
  end

  def update
    @review.update(review_params)
    render json: @review, status: 200
  end

  def destroy
    reviewId = @review.id
    @review.destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.fetch(:review, {})
  end
end
