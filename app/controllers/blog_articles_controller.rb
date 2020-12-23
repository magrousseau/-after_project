class BlogArticlesController < ApplicationController
  before_action :find_article, only: [:show]
  def index
    @articles = BlogArticle.all
    authorize @articles
  end

  def show

  end

  private

  def article_params
    strong_params = params.require(:blog_articles).permit(:title, :description, :content, :date)
  end

  def find_article
    @article = BlogArticle.find(params[:id])
    authorize @article
  end
end
