class CategoriesController < ApplicationController
before_action :set_category, only: [:show, :update, :destroy]
after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    @pagy, @categories = pagy(Category.all)
    render json: @categories
  end

  def show
    @category = Category.find(params[:id])
    render json: @category
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category
    else
      render json: @category.errors
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category
    end
  end

  def destroy
    @category.destroy
  end

  private

  def set_screening
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
