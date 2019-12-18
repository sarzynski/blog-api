class ArticlesController < ApplicationController
before_action :set_article, only: [:show, :update, :destroy]
after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    @pagy, @articles = pagy(Article.all)
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article
    else
      render json: @article.errors
    end
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors
    end
  end

  def destroy
    @article.destroy
  end

  private

  def set_screening
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :image, :status, :publish_date, :user_id, :category_id)
  end
end
